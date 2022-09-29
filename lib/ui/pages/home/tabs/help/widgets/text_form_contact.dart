import 'package:fluent_ui/fluent_ui.dart';

class TextFormContact extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focus;
  final FocusNode nextFocus;
  final String header;
  final int? maxLines;

  const TextFormContact(
      {super.key,
      required this.controller,
      required this.focus,
      required this.nextFocus,
      required this.header,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextFormBox(
      maxLines: maxLines ?? 1,
      controller: controller,
      focusNode: focus,
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(nextFocus);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Debes ingresar un $header.";
        }
        return null;
      },
      header: header,
      headerStyle: const TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
      suffix: IconButton(
          icon: const Icon(FluentIcons.clear),
          onPressed: () {
            controller.clear();
          }),
      decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
    );
  }
}
