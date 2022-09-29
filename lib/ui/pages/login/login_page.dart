import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigest/constants/constant.dart';
import 'package:sigest/domain/bloc/auth/auth_bloc.dart';
import 'package:sigest/ui/pages/login/widgets/login_form.dart';
import 'package:sigest/ui/widgets/background.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushReplacementNamed(context, '/home');
          }
          if (state is AuthError) {
            kIsWeb
                ? showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return Container(
                        color: Colors.blue.withOpacity(0.2),
                        child: AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0))),
                          backgroundColor: Colors.grey[100],
                          title: Row(
                            children: [
                              Image.asset(
                                'assets/images/icon/icon.png',
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  "Error",
                                  style: titleAlertDialogStyle,
                                ),
                              ),
                            ],
                          ),
                          //contentPadding: EdgeInsets.all(55),
                          content: Text(
                            state.error.substring(11),
                            style: contentAlertDialogStyle,
                          ),
                          actions: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: primaryButtonStyle,
                                child: const Text("Aceptar"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error.substring(11))));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Loading) {
              return Container();
            }
            if (state is UnAuthenticated || state is UnVerified) {
              // Showing the sign in form if the user is not authenticated
              return Form(
                key: _formKey,
                child: Stack(
                  children: <Widget>[
                    const Background(),
                    LoginForm(formKey: _formKey),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
