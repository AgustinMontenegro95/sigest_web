import 'package:fluent_ui/fluent_ui.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sigest/constants/constant.dart';

class ConstPendingProductRow extends StatelessWidget {
  const ConstPendingProductRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSmallerThanDesktop =
        ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    bool isSmallerThanMobile =
        ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(color: Colors.blue.withOpacity(0.9)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * codeWidthColSmall,
            child: Text(
              "Código",
              style: isSmallerThanDesktop
                  ? styleTextConstProductRow.copyWith(fontSize: 19.5)
                  : styleTextConstProductRow,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * nameWidthColSmall,
            child: Text(
              "Nombre",
              style: isSmallerThanDesktop
                  ? styleTextConstProductRow.copyWith(fontSize: 19.5)
                  : styleTextConstProductRow,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * amountWidthColSmall,
            child: Text(
              isSmallerThanMobile ? 'Cant.' : 'Cantidad',
              style: isSmallerThanDesktop
                  ? styleTextConstProductRow.copyWith(fontSize: 19.5)
                  : styleTextConstProductRow,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * buttonsWidthColSmall,
              child: Container()),
        ],
      ),
    );
  }
}
