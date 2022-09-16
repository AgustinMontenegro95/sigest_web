import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.2,
          colors: <Color>[
            Colors.blue.shade900.withOpacity(0.7),
            Colors.blue.shade900,
          ],
          tileMode: TileMode.mirror,
        ),
      ),
    );
  }
}
