import 'package:flutter/material.dart';

class ResetPassButton extends StatelessWidget {
  const ResetPassButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text(
        '¿Olvido la contraseña?',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/resetpass');
      },
    );
  }
}
