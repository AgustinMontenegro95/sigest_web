import 'package:fluent_ui/fluent_ui.dart';
import 'package:sigest/constants/constant.dart';

class ConstProductRow extends StatelessWidget {
  const ConstProductRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(color: Colors.blue.withOpacity(0.9)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _columnName(context, widthCol: codeWidthCol, value: 'Código'),
          _columnName(context, widthCol: nameWidthCol, value: 'Nombre'),
          _columnName(context, widthCol: descWidthCol, value: 'Descripción'),
          _columnName(context, widthCol: amountWidthCol, value: 'Cantidad'),
          _columnName(context,
              widthCol: purchasePriceWidthCol, value: 'P. compra'),
          _columnName(context, widthCol: priceWidthCol, value: 'P. venta'),
          _columnName(context, widthCol: providerWidthCol, value: 'Proveedor'),
          _columnName(context, widthCol: categoryWidthCol, value: 'Categoría'),
          SizedBox(
              width: MediaQuery.of(context).size.width * buttonsWidthCol,
              child: Container()),
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
