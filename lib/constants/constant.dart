//Colors
import 'package:flutter/material.dart';

Color primaryColor = Colors.blue.shade900;
Color secondaryColor = Colors.white;
Color tertiaryColor = Colors.blue;

//TextStyle Stock
TextStyle styleTextConstProductRow =
    const TextStyle(color: Colors.white, fontSize: 25, letterSpacing: 2);
//TextStyle Stock
TextStyle styleTextProductSearch =
    const TextStyle(color: Colors.black, fontSize: 30, letterSpacing: 2);
TextStyle styleTextProductRow =
    const TextStyle(color: Colors.black, fontSize: 18);

//TextStyle Stock
TextStyle styleText =
    const TextStyle(color: Colors.black, fontSize: 25, letterSpacing: 2);

//AlertDialog - TextStyle
TextStyle titleAlertDialogStyle = TextStyle(
    color: Colors.blue.shade700, fontWeight: FontWeight.bold, fontSize: 22);
TextStyle contentAlertDialogStyle = TextStyle(
    color: Colors.blue.shade500, fontWeight: FontWeight.w400, fontSize: 17);
TextStyle contentAlertDialogStyle2 = TextStyle(
    color: Colors.blue.shade600, fontWeight: FontWeight.w500, fontSize: 18);

//Error TextField
TextStyle styleErrorWeb = const TextStyle(color: Colors.white, fontSize: 20);
TextStyle styleErrorMobile = const TextStyle(color: Colors.white, fontSize: 13);

//Button Style
ButtonStyle primaryButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.blue),
  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
  ),
);

//List values ComboBox
List<String> valuesComboBox = [
  'Precio venta ascendente',
  'Precio venta descendente',
  'Cantidad ascendente',
  'Cantidad descendente',
  'Nombre ascendente',
  'Nombre descendente',
  'Precio compra ascendente',
  'Precio compra descendente'
];

// width columns Large
double codeWidthColLarge = 0.1;
double nameWidthColLarge = 0.175;
double descWidthColLarge = 0.175;
double amountWidthColLarge = 0.1;
double priceWidthColLarge = 0.1;
double purchasePriceWidthColLarge = 0.1;
double providerWidthColLarge = 0.1;
double categoryWidthColLarge = 0.1;
double buttonsWidthColLarge = 0.05;

// width columns Medium
double codeWidthColMedium = 0.125;
double nameWidthColMedium = 0.25;
double amountWidthColMedium = 0.175;
double buttonsWidthColMedium = 0.075;

// width columns Small
double codeWidthColSmall = 0.25;
double nameWidthColSmall = 0.35;
double amountWidthColSmall = 0.2;
double buttonsWidthColSmall = 0.2;

ButtonStyle mobilButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.green),
  padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),
);
ButtonStyle mobilButtonStyle2 = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.green),
  padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
);
