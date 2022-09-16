import 'package:fluent_ui/fluent_ui.dart';
import 'package:sigest/constants/constant.dart';
import 'package:sigest/data/models/user_model/user_model.dart';

import 'widgets/sign_out_button.dart';

class ProfilTab extends StatelessWidget {
  final UserModel userModel;

  const ProfilTab({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
        header: const PageHeader(
          title: Text('Mi perfil'),
        ),
        content: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.network(
                  userModel.image.toString(),
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 150,
                height: 10,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(30)),
              ),
              Column(
                children: [
                  Text(userModel.name,
                      style: styleText.copyWith(fontWeight: FontWeight.bold)),
                  Text(userModel.email,
                      style: styleText.copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                width: 150,
                height: 10,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(30)),
              ),
              const SignOut(),
            ],
          ),
        ));
  }
}
