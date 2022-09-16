import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigest/constants/constant.dart';
import 'package:sigest/domain/bloc/auth/auth_bloc.dart';

class LogInButton extends StatelessWidget {
  final double screenWidth;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const LogInButton(
      {super.key,
      required this.screenWidth,
      required this.emailController,
      required this.passwordController,
      required this.formKey});

  @override
  Widget build(BuildContext context) {
    void _authenticateWithEmailAndPassword(context) {
      if (formKey.currentState!.validate()) {
        BlocProvider.of<AuthBloc>(context).add(
          SignInRequested(emailController.text, passwordController.text),
        );
      }
    }

    return ElevatedButton(
      onPressed: () {
        _authenticateWithEmailAndPassword(context);
      },
      style: primaryButtonStyle,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * screenWidth,
        child: const Text(
          "Ingresar",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
