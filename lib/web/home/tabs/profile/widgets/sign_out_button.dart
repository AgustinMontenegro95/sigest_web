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
                title: const Text('Alerta'),
                content: const Text('¿Esta seguro?'),
                actions: [
                  Button(
                    child: const Text('OK'),
                    onPressed: () {
                      context.read<AuthBloc>().add(SignOutRequested());
                    },
                  ),
                  Button(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
      },
    );
  }
}
