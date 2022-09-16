import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sigest/constants/constant.dart';
import 'package:sigest/ui/pages/login/widgets/login_button.dart';
import 'package:sigest/ui/pages/login/widgets/reset_pass_button.dart';
import 'package:sigest/ui/widgets/powered_by.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const LoginForm({super.key, required this.formKey});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late FocusNode focusMail, focusPassword;

  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    focusMail = FocusNode();
    focusPassword = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    focusMail.dispose();
    focusPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: MediaQuery.of(context).size.width <= 500
          ? _loginForm(context, screenWidth: 0.7)
          : MediaQuery.of(context).size.width > 500 &&
                  MediaQuery.of(context).size.width <= 800
              ? _loginForm(context, screenWidth: 0.5)
              : MediaQuery.of(context).size.width > 800 &&
                      MediaQuery.of(context).size.width <= 1200
                  ? _loginForm(context, screenWidth: 0.35)
                  : _loginForm(context, screenWidth: 0.25),
    );
  }

  SizedBox _loginForm(BuildContext context, {required double screenWidth}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: const Image(
                image: AssetImage("assets/images/icon/icon.png"),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * screenWidth,
            child: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                TextFormField(
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(focusPassword);
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                TextFormField(
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  focusNode: focusPassword,
                  textCapitalization: TextCapitalization.none,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    errorStyle: kIsWeb ? styleErrorWeb : styleErrorMobile,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(), //BorderSide.none,
                    ),
                    icon: GestureDetector(
                      child: Icon(
                        _passwordVisible
                            ? CupertinoIcons.eye
                            : CupertinoIcons.eye_slash,
                        color: Colors.white,
                      ),
                      onTap: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    hintText: 'Contraseña',
                  ),
                  controller: _passwordController,
                  obscureText: !_passwordVisible,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value != null && value.length < 6) {
                      return "Ingresa min. 6 caracteres";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                LogInButton(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  formKey: widget.formKey,
                  screenWidth: screenWidth,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                const ResetPassButton(),
              ],
            ),
          ),
          const PoweredBy(),
        ],
      ),
    );
  }
}
