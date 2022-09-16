import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sigest/constants/constant.dart';

class ResetPassForm extends StatelessWidget {
  const ResetPassForm({
    Key? key,
    required this.focusMail,
    required TextEditingController emailController,
    required GlobalKey<FormState> formKey,
    required this.auth,
  })  : _emailController = emailController,
        _formKey = formKey,
        super(key: key);

  final FocusNode focusMail;
  final TextEditingController _emailController;
  final GlobalKey<FormState> _formKey;
  final FirebaseAuth auth;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width <= 500
        ? 0.7
        : MediaQuery.of(context).size.width > 500 &&
                MediaQuery.of(context).size.width <= 800
            ? 0.5
            : MediaQuery.of(context).size.width > 800 &&
                    MediaQuery.of(context).size.width <= 1200
                ? 0.35
                : 0.25;

    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              child: const Image(
                image: AssetImage("assets/images/icon/icon.png"),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * screenWidth,
              child: Column(
                children: <Widget>[
                  const Text(
                    'Restablecer contraseña',
                    style: TextStyle(
                        letterSpacing: 2.5,
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Ingresa tu e-mail para un restablecimiento automático o comunicate con soporte técnico para gestionar el cambio.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  TextFormField(
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    focusNode: focusMail,
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      errorStyle: kIsWeb ? styleErrorWeb : styleErrorMobile,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(), //BorderSide.none,
                      ),
                      icon: const Icon(
                        CupertinoIcons.mail,
                        color: Colors.white,
                      ),
                      hintText: 'E-mail',
                    ),
                    controller: _emailController,
                    obscureText: false,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return value != null && !EmailValidator.validate(value)
                          ? 'Ingresa un e-mail valido.'
                          : null;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        if (_formKey.currentState!.validate()) {
                          await auth.sendPasswordResetEmail(
                              email: _emailController.text.trim());
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Solicitud de restablecimiento de contraseña enviada. Verifica tu bandeja de entrada de correo electrónico (o SPAM).")));
                          Navigator.of(context).pop();
                        }
                      } on FirebaseAuthException catch (e) {
                        String contenido = "";
                        switch (e.code) {
                          case 'account-exists-with-different-credential':
                            contenido =
                                'Esta cuenta existe con un proveedor de inicio de sesión diferente.';
                            break;
                          case 'invalid-credential':
                            contenido = 'Ha ocurrido un error desconocido.';
                            break;
                          case 'operation-not-allowed':
                            contenido = 'Esta operación no esta permitida.';
                            break;
                          case 'user-disabled':
                            contenido =
                                'El e-mail con el que intentó restablecer la contraseña está deshabilitado.';
                            break;
                          case 'user-not-found':
                            contenido =
                                'El e-mail con el que intentó restablecer la contraseña no fue encontrado.';
                            break;
                        }
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          contenido,
                        )));
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 15)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ))),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * screenWidth,
                      child: const Text(
                        "Enviar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
