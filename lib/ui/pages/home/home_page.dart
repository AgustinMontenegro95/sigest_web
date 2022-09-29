import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigest/domain/bloc/auth/auth_bloc.dart';
import 'package:sigest/domain/bloc/user/user_bloc.dart';
import 'package:sigest/ui/pages/home/widgets/navigator_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          // Navegar a la pantalla de inicio de sesión cuando el usuario cierra la sesión
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', (route) => false);
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return Container(
            child: state.maybeWhen(
                loaded: (user) {
                  return NavigatorViewWidget(
                    userModel: user!,
                  );
                },
                loading: () {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            'assets/images/icon/icon-s.png',
                            width: 100,
                          ),
                        ),
                      ),
                      const ProgressBar(),
                    ],
                  );
                },
                orElse: () => const ProgressBar()),
          );
        },
      ),
    );
  }
}
