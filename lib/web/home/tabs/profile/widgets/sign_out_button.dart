import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigest/domain/bloc/auth/auth_bloc.dart';

class SignOut extends StatelessWidget {
  const SignOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button(
      style:
          ButtonStyle(backgroundColor: ButtonState.all<Color?>(Colors.green)),
      child: const Text(
        'Cerrar Sesión',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return ContentDialog(
                title: const Text(
                  'Sigest',
                  style: TextStyle(fontSize: 25),
                ),
                content: const Text(
                  '¿Está seguro?',
                  style: TextStyle(fontSize: 20),
                ),
                actions: [
                  Button(
                    style: ButtonStyle(
                        backgroundColor: ButtonState.all<Color?>(Colors.green)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Button(
                    style: ButtonStyle(
                        backgroundColor: ButtonState.all<Color?>(Colors.red)),
                    onPressed: () {
                      context.read<AuthBloc>().add(SignOutRequested());
                    },
                    child: const Text(
                      'Cerrar sesión',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              );
            });
      },
    );
  }
}
