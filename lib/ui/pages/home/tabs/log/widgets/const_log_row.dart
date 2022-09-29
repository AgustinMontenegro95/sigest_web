import 'package:fluent_ui/fluent_ui.dart';
import 'package:sigest/constants/constant.dart';

class ConstLogRow extends StatelessWidget {
  const ConstLogRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(color: Colors.blue.withOpacity(0.9)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _columnName(context, widthCol: 0.2, value: 'Acción'),
          _columnName(context, widthCol: 0.4, value: 'Descripción'),
          _columnName(context, widthCol: 0.2, value: 'Fecha'),
        ],
      ),
    );
  }

  SizedBox _columnName(BuildContext context,
      {required double widthCol, required String value}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * widthCol,
      child: Text(
        value,
        style: styleTextConstProductRow,
        textAlign: TextAlign.center,
      ),
    );
  }
}
