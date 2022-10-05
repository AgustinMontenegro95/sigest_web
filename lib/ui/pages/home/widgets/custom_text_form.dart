import 'package:fluent_ui/fluent_ui.dart';

class CustomTextFormBox extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int? maxLength;
  final bool isNumber;

  const CustomTextFormBox({
    super.key,
    required this.controller,
    required this.label,
    required this.isNumber,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormBox(
      maxLength: maxLength != 0 ? maxLength : 0,
      style: const TextStyle(fontSize: 25),
      header: label,
      headerStyle: const TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
      controller: controller,
      suffix: IconButton(
          icon: const Icon(FluentIcons.clear),
          onPressed: () {
            controller.clear();
          }),
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      validator: isNumber
          ? (value) {
              bool isNum = double.tryParse(value!) != null;
              if ((value.isEmpty) || !isNum) {
                return 'Debe ingresar ${label.toLowerCase()} (numérico).';
              }
              return null;
            }
          : (value) {
              if (value == null || value.isEmpty) {
                return 'Debe ingresar ${label.toLowerCase()}.';
              }
              return null;
            },
      decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
    );
  }
}
