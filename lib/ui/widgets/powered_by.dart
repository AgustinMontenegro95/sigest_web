import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PoweredBy extends StatelessWidget {
  const PoweredBy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.developer_mode_rounded,
          color: Colors.white,
          size: 15,
        ),
        const Text(
          "Impulsado por:",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        TextButton(
          onPressed: () async {
            final Uri url = Uri.parse('https://soludevs.web.app/');
            if (!await launchUrl(url)) {
              throw 'Could not launch $url';
            }
          },
          child: const Text(
            "SOLUDEV",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
