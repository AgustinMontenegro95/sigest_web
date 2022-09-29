import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigest/domain/bloc/auth/auth_bloc.dart';
import 'package:sigest/ui/pages/login/widgets/reset_pass_form.dart';
import 'package:sigest/ui/widgets/background.dart';

class ResetPassPage extends StatefulWidget {
  const ResetPassPage({Key? key}) : super(key: key);

  @override
  State<ResetPassPage> createState() => _ResetPassPageState();
}

class _ResetPassPageState extends State<ResetPassPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  late FocusNode focusMail, focusPassword;

  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    focusMail = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    focusMail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushReplacementNamed(context, '/home');
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UnAuthenticated) {
              return Form(
                key: _formKey,
                child: Stack(
                  children: <Widget>[
                    const Background(),
                    ResetPassForm(
                        focusMail: focusMail,
                        emailController: _emailController,
                        formKey: _formKey,
                        auth: auth),
                    if (!kIsWeb)
                      Positioned(
                        top: 50,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
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
