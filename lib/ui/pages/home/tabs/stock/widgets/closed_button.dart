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
          border: ButtonState.all(BorderSide(
              color: Colors.red, width: 1.0, style: BorderStyle.solid))),
      onPressed: () {
        Navigator.of(context).pop([false]);
      },
      child: Image.asset(
        'assets/images/close_icon.png',
        fit: BoxFit.cover,
        width: 25,
      ),
    );
  }
}
