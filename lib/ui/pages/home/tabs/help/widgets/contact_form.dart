import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigest/data/models/log_model/log_model.dart';
import 'package:sigest/data/models/user_model/user_model.dart';
import 'package:sigest/domain/bloc/log/log_bloc.dart';
import 'package:sigest/domain/repositories/contact_repository.dart';
import 'package:sigest/ui/pages/home/tabs/help/widgets/text_form_contact.dart';

class ContactForm extends StatefulWidget {
  final UserModel userModel;
  const ContactForm({super.key, required this.userModel});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final subjectController = TextEditingController();
  final descController = TextEditingController();
  late FocusNode focusSubject, focusDesc;

  @override
  void initState() {
    focusSubject = FocusNode();
    focusDesc = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    subjectController.dispose();
    descController.dispose();
    focusSubject.dispose();
    focusDesc.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormContact(
            controller: subjectController,
            focus: focusSubject,
            nextFocus: focusDesc,
            header: 'Asunto',
          ),
          TextFormContact(
            controller: descController,
            focus: focusDesc,
            nextFocus: FocusNode(),
            header: 'Mensaje',
            maxLines: 5,
          ),
          Button(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                ContactRepository().sendEmail(
                  name: widget.userModel.name,
                  email: widget.userModel.email,
                  subject: subjectController.text.trim(),
                  message: "      Email: ${widget.userModel.email}."
                      "     Nombre: ${widget.userModel.name}."
                      "     Mensaje: ${descController.text.trim()}.",
                  context: context,
                );
                final log = LogModel(
                  action: 'Envio consulta',
                  desc:
                      'Envió una nueva consulta. [Contenido: ${descController.text.trim()}]',
                  date: DateTime.now().toString().substring(0, 19),
                );
                context.read<LogBloc>().add(LogEvent.add(log: log));
              }
              subjectController.clear();
              descController.clear();
            },
            style: ButtonStyle(
                backgroundColor: ButtonState.all<Color?>(Colors.green)),
            child: const Text(
              "Enviar consulta",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
