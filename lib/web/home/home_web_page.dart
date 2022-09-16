import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigest/domain/bloc/auth/auth_bloc.dart';
import 'package:sigest/domain/bloc/user/user_bloc.dart';
import 'package:sigest/web/home/widgets/navigator_view_widget.dart';

class HomeWebPage extends StatefulWidget {
  const HomeWebPage({Key? key}) : super(key: key);

  @override
  State<HomeWebPage> createState() => _HomeWebPageState();
}

class _HomeWebPageState extends State<HomeWebPage> {
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
                loading: () => const Center(child: ProgressBar()),
                orElse: () => const ProgressBar()),
          );
        },
      ),
    );
  }
}
