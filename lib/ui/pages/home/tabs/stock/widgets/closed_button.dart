import 'package:fluent_ui/fluent_ui.dart';

class ClosedButton extends StatelessWidget {
  const ClosedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button(
      style: ButtonStyle(
        backgroundColor: ButtonState.all<Color?>(Colors.white),
        border: ButtonState.all(
          BorderSide(color: Colors.red, width: 1.0, style: BorderStyle.solid),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop([false]);
      },
      child: Icon(
        FluentIcons.chrome_close,
        color: Colors.red,
        size: 20,
      ),
    );
  }
}
