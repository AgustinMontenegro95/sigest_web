import 'package:fluent_ui/fluent_ui.dart';
import 'package:sigest/constants/constant.dart';

class ConstPendingProductRow extends StatelessWidget {
  const ConstPendingProductRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(color: Colors.blue.withOpacity(0.9)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * codeWidthCol,
            child: Text(
              "Código",
              style: styleTextConstProductRow,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * nameWidthCol,
            child: Text(
              "Nombre",
              style: styleTextConstProductRow,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * amountWidthCol,
            child: Text(
              "Cantidad",
              style: styleTextConstProductRow,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * buttonsWidthCol,
              child: Container()),
        ],
      ),
    );
  }
}
