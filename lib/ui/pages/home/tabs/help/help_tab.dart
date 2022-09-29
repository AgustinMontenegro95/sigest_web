import 'package:fluent_ui/fluent_ui.dart';
import 'package:sigest/data/models/user_model/user_model.dart';
import 'package:sigest/ui/pages/home/tabs/help/widgets/contact.dart';

class HelpTab extends StatelessWidget {
  final UserModel userModel;

  const HelpTab({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
        header: const PageHeader(
          title: Text('Ayuda'),
        ),
        content: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Opacity(
                    opacity: 0.2,
                    child: Image.asset('assets/images/icon/icon-black.png')),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Contact(userModel: userModel),
                ],
              ),
            ],
          ),
        ));
  }
}
