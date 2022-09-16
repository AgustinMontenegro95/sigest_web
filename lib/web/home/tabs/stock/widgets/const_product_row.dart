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
            width: MediaQuery.of(context).size.width * descWidthCol,
            child: Text(
              "Descripción",
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
            width: MediaQuery.of(context).size.width * purchasePriceWidthCol,
            child: Text(
              "P. compra",
              style: styleTextConstProductRow,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * priceWidthCol,
            child: Text(
              "P. venta",
              style: styleTextConstProductRow,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * providerWidthCol,
            child: Text(
              "Proveedor",
              style: styleTextConstProductRow,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * categoryWidthCol,
            child: Text(
              "Categoría",
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
