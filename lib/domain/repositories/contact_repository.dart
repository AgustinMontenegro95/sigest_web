import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluent_ui/fluent_ui.dart';
import 'package:sigest/web/home/tabs/help/widgets/custom_content_dialog.dart';

class ContactRepository {
  Future sendEmail(
      {required String name,
      required String email,
      required String subject,
      required String message,
      required BuildContext context}) async {
    const serviceId = 'service_dvkuq1m';
    const templateId = 'template_0f6hyjb';
    const userId = 'urhOJhqRSNLtJx_L1';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_subject': subject,
          'user_message': message,
        }
      }),
    );
    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (context) {
          return const CustomContentDialog(
            title: 'Contacto',
            content:
                'Su mensaje fue enviado exitosamente, recibirá una respuesta a la brevedad. Gracias por comunicarte con nosotros.',
            textButton: 'Aceptar',
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const CustomContentDialog(
            title: 'Error',
            content:
                'Debes ingresar los campos solicitados para poder continuar.',
            textButton: 'Aceptar',
          );
        },
      );
    }
  }
}
