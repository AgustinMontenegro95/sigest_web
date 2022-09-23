import 'package:fluent_ui/fluent_ui.dart';

class CustomContentDialog extends StatelessWidget {
  final String title;
  final String content;
  final String textButton;

  const CustomContentDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.textButton});

  @override
  Widget build(BuildContext context) {
    return ContentDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        Button(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ButtonStyle(
                backgroundColor: ButtonState.all<Color?>(Colors.green)),
            child: Text(textButton,
                style: TextStyle(fontSize: 20, color: Colors.white))),
      ],
    );
  }
}
