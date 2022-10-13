import 'package:fluent_ui/fluent_ui.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sigest/constants/constant.dart';

class ConstProductRow extends StatelessWidget {
  const ConstProductRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    //
    bool isSmallerThanTabletLarge =
        ResponsiveWrapper.of(context).isSmallerThan('TABLET_LARGE');
    bool isSmallerThanDesktop =
        ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    bool isSmallerThanMobile =
        ResponsiveWrapper.of(context).isSmallerThan('MOBILE');
    //
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(color: Colors.blue.withOpacity(0.9)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: isSmallerThanDesktop
                ? isSmallerThanTabletLarge
                    ? widthSize * codeWidthColSmall
                    : widthSize * codeWidthColMedium
                : widthSize * codeWidthColLarge,
            child: Text(
              'Código',
              style: isSmallerThanDesktop
                  ? styleTextConstProductRow.copyWith(fontSize: 19.5)
                  : styleTextConstProductRow,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: isSmallerThanDesktop
                ? isSmallerThanTabletLarge
                    ? widthSize * nameWidthColSmall
                    : widthSize * nameWidthColMedium
                : widthSize * nameWidthColLarge,
            child: Text(
              'Nombre',
              style: isSmallerThanDesktop
                  ? styleTextConstProductRow.copyWith(fontSize: 19.5)
                  : styleTextConstProductRow,
              textAlign: TextAlign.center,
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [
              Condition.largerThan(name: TABLET),
            ],
            child: SizedBox(
              width: widthSize * descWidthColLarge,
              child: Text(
                'Descripción',
                style: isSmallerThanDesktop
                    ? styleTextConstProductRow.copyWith(fontSize: 19.5)
                    : styleTextConstProductRow,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            width: isSmallerThanDesktop
                ? isSmallerThanTabletLarge
                    ? widthSize * amountWidthColSmall
                    : widthSize * amountWidthColMedium
                : widthSize * amountWidthColLarge,
            child: Text(
              isSmallerThanMobile ? 'Cant.' : 'Cantidad',
              style: isSmallerThanDesktop
                  ? styleTextConstProductRow.copyWith(fontSize: 19.5)
                  : styleTextConstProductRow,
              textAlign: TextAlign.center,
            ),
          ),
          ResponsiveVisibility(
              visible: false,
              visibleWhen: const [
                Condition.largerThan(name: TABLET),
              ],
              child: SizedBox(
                width: widthSize * purchasePriceWidthColLarge,
                child: Text(
                  'P. compra',
                  style: isSmallerThanDesktop
                      ? styleTextConstProductRow.copyWith(fontSize: 19.5)
                      : styleTextConstProductRow,
                  textAlign: TextAlign.center,
                ),
              )),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [
              Condition.largerThan(name: TABLET),
            ],
            child: SizedBox(
              width: widthSize * priceWidthColLarge,
              child: Text(
                'P. venta',
                style: isSmallerThanDesktop
                    ? styleTextConstProductRow.copyWith(fontSize: 19.5)
                    : styleTextConstProductRow,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [
              Condition.largerThan(name: 'TABLET_LARGE'),
            ],
            child: SizedBox(
              width: widthSize * providerWidthColLarge,
              child: Text(
                'Proveedor',
                style: styleTextConstProductRow,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [
              Condition.largerThan(name: 'TABLET_LARGE'),
            ],
            child: SizedBox(
              width: widthSize * categoryWidthColLarge,
              child: Text(
                'Categoría',
                style: styleTextConstProductRow,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
              width: isSmallerThanDesktop
                  ? isSmallerThanTabletLarge
                      ? widthSize * buttonsWidthColSmall
                      : widthSize * buttonsWidthColMedium
                  : widthSize * buttonsWidthColLarge,
              child: Container()),
        ],
      ),
    );
  }
}
