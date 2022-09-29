import 'package:fluent_ui/fluent_ui.dart';
import 'package:sigest/data/models/user_model/user_model.dart';
import 'package:sigest/ui/pages/home/tabs/help/widgets/contact_form.dart';

class Contact extends StatelessWidget {
  final UserModel userModel;

  const Contact({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text("¿Tienes problemas? Contactanos para solucionarlos.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(0.0, 0.0),
                        blurRadius: 3.0,
                        color: Colors.white,
                      ),
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 3.0,
                        color: Colors.white,
                      ),
                    ],
                  )),
            ),
            ContactForm(
              userModel: userModel,
            ),
          ],
        ),
      ),
    );
  }
}
