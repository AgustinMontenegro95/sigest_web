import 'package:fluent_ui/fluent_ui.dart';

class ProductAttribute extends StatelessWidget {
  const ProductAttribute(
      {super.key, required this.attribute, required this.value});

  final String attribute;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: attribute,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          TextSpan(text: value, style: const TextStyle(fontSize: 25)),
        ],
      ),
    );
  }
}
