import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sigest/constants/constant.dart';
import 'package:sigest/data/models/log_model/log_model.dart';
import 'package:sigest/data/models/product_model/product_model.dart';
import 'package:sigest/data/models/user_model/user_model.dart';
import 'package:sigest/domain/bloc/log/log_bloc.dart';
import 'package:sigest/domain/bloc/product/product_bloc.dart';
import 'package:sigest/ui/pages/home/tabs/stock/widgets/content_product.dart';
import 'package:sigest/ui/pages/home/tabs/stock/widgets/product_attribute.dart';

class ProductRow extends StatefulWidget {
  final ProductModel productModel;
  final UserModel userModel;
  final int index;

  const ProductRow(
      {super.key,
      required this.productModel,
      required this.index,
      required this.userModel});

  @override
  State<ProductRow> createState() => _ProductRowState();
}

class _ProductRowState extends State<ProductRow> {
  TextEditingController descController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController purchasePriceController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController providerController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  void initState() {
    descController.text = widget.productModel.desc!;
    amountController.text = widget.productModel.amount.toString();
    purchasePriceController.text = widget.productModel.purchasePrice.toString();
    priceController.text = widget.productModel.price.toString();
    providerController.text = widget.productModel.provider!;
    categoryController.text = widget.productModel.category!;
    super.initState();
  }

  @override
  void dispose() {
    descController.dispose();
    amountController.dispose();
    purchasePriceController.dispose();
    priceController.dispose();
    providerController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    //
    bool isSmallerThanTabletLarge =
        ResponsiveWrapper.of(context).isSmallerThan('TABLET_LARGE');
    bool isSmallerThanDesktop =
        ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    //
    return Container(
      decoration: BoxDecoration(
          color: widget.productModel.amount! <= 5
              ? Colors.red.withOpacity(0.3)
              : widget.productModel.amount! <= 10
                  ? Colors.yellow.withOpacity(0.4)
                  : widget.index % 2 == 0
                      ? Colors.grey.withOpacity(0.2)
                      : Colors.white),
      padding: isSmallerThanTabletLarge
          ? const EdgeInsets.symmetric(vertical: 7)
          : const EdgeInsets.symmetric(vertical: 13),
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
              widget.productModel.code.toString(),
              textAlign: TextAlign.center,
              style: isSmallerThanTabletLarge
                  ? styleTextProductRow.copyWith(fontSize: 16)
                  : styleTextProductRow,
            ),
          ),
          SizedBox(
            width: isSmallerThanDesktop
                ? isSmallerThanTabletLarge
                    ? widthSize * nameWidthColSmall
                    : widthSize * nameWidthColMedium
                : widthSize * nameWidthColLarge,
            child: Text(
              widget.productModel.name,
              textAlign: TextAlign.center,
              style: isSmallerThanTabletLarge
                  ? styleTextProductRow.copyWith(fontSize: 16)
                  : styleTextProductRow,
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: TABLET)],
            child: SizedBox(
              width: widthSize * descWidthColLarge,
              child: ReadMoreText(
                widget.productModel.desc!,
                textAlign: TextAlign.center,
                style: styleTextProductRow,
                trimLines: 1,
                trimMode: TrimMode.Line,
                trimCollapsedText: '(+)',
                trimExpandedText: '(-)',
                lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
                moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
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
              widget.productModel.amount.toString(),
              textAlign: TextAlign.center,
              style: isSmallerThanTabletLarge
                  ? styleTextProductRow.copyWith(fontSize: 16)
                  : styleTextProductRow,
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: TABLET)],
            child: SizedBox(
              width: widthSize * purchasePriceWidthColLarge,
              child: Text(
                widget.productModel.purchasePrice.toString(),
                textAlign: TextAlign.center,
                style: styleTextProductRow,
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: TABLET)],
            child: SizedBox(
              width: widthSize * priceWidthColLarge,
              child: Text(
                widget.productModel.price.toString(),
                style: styleTextProductRow,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: 'TABLET_LARGE')],
            child: SizedBox(
              width: widthSize * providerWidthColLarge,
              child: ReadMoreText(
                widget.productModel.provider!,
                textAlign: TextAlign.center,
                style: styleTextProductRow,
                trimLines: 1,
                trimMode: TrimMode.Line,
                trimCollapsedText: '(+)',
                trimExpandedText: '(-)',
                lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
                moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: 'TABLET_LARGE')],
            child: SizedBox(
              width: widthSize * categoryWidthColLarge,
              child: ReadMoreText(
                widget.productModel.category!,
                textAlign: TextAlign.center,
                style: styleTextProductRow,
                trimLines: 1,
                trimMode: TrimMode.Line,
                trimCollapsedText: '(+)',
                trimExpandedText: '(-)',
                lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
                moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
          ),
          SizedBox(
            width: isSmallerThanDesktop
                ? isSmallerThanTabletLarge
                    ? widthSize * buttonsWidthColSmall
                    : widthSize * buttonsWidthColMedium
                : widthSize * buttonsWidthColLarge,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Tooltip(
                  message: 'Ver detalles',
                  child: FilledButton(
                    style: ButtonStyle(
                        backgroundColor: ButtonState.all<Color?>(Colors.green)),
                    onPressed: () async {
                      await showDialog(
                          context: context,
                          builder: (context) {
                            return ContentProduct(
                              userModel: widget.userModel,
                              widget: widget,
                              descController: descController,
                              amountController: amountController,
                              purchasePriceController: purchasePriceController,
                              priceController: priceController,
                              providerController: providerController,
                              categoryController: categoryController,
                            );
                          }).then((value) {
                        final result = value as List;
                        if (result[0] == true) {
                          confirmChanges(context, result[1]);
                        }
                      });
                    },
                    child: const Icon(FluentIcons.add),
                  ),
                ),
                Tooltip(
                  message: 'Eliminar producto',
                  child: FilledButton(
                    style: ButtonStyle(
                        backgroundColor: ButtonState.all<Color?>(Colors.red)),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ContentDialog(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.5),
                            title: Text(
                              '??Esta seguro que desea eliminar este producto?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ProductAttribute(
                                  attribute: 'C??digo: ',
                                  value: widget.productModel.code.toString(),
                                ),
                                ProductAttribute(
                                  attribute: 'Nombre: ',
                                  value: widget.productModel.name,
                                ),
                              ],
                            ),
                            actions: [
                              Button(
                                  style: ButtonStyle(
                                      backgroundColor: ButtonState.all<Color?>(
                                          Colors.green)),
                                  child: const Text(
                                    'Cancelar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                              Button(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          ButtonState.all<Color?>(Colors.red)),
                                  child: const Text(
                                    'Eliminar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    final log = LogModel(
                                      action: 'Eliminar activo',
                                      desc:
                                          'Elimin?? un producto activo. [C??digo: ${widget.productModel.code}, Nombre: ${widget.productModel.name}]',
                                      date: DateTime.now()
                                          .toString()
                                          .substring(0, 19),
                                    );
                                    context
                                        .read<LogBloc>()
                                        .add(LogEvent.add(log: log));
                                    context.read<ProductBloc>().add(
                                        ProductEvent.delete(
                                            nameProduct:
                                                widget.productModel.name));
                                    context
                                        .read<ProductBloc>()
                                        .add(const ProductEvent.getActive());
                                    Navigator.pop(context);
                                    showSnackbar(
                                      context,
                                      Snackbar(
                                        extended: true,
                                        content: Text(
                                            'Se elimin?? correctamente el producto: ${widget.productModel.name}.'),
                                      ),
                                    );
                                  }),
                            ],
                          );
                        },
                      );
                    },
                    child: const Icon(FluentIcons.delete),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void confirmChanges(BuildContext context, ProductModel productModel) {
    showDialog(
      context: context,
      builder: (context) {
        return ContentDialog(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.5),
          title: Text(
            '??Esta seguro que desea actualizar el producto?',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ProductAttribute(
                attribute: 'C??digo: ',
                value: widget.productModel.code.toString(),
              ),
              ProductAttribute(
                attribute: 'Nombre: ',
                value: widget.productModel.name,
              ),
            ],
          ),
          actions: [
            Button(
              style: ButtonStyle(
                  backgroundColor: ButtonState.all<Color?>(Colors.red)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Button(
              style: ButtonStyle(
                  backgroundColor:
                      ButtonState.all<Color?>(Colors.yellow.darker)),
              onPressed: () {
                final log = LogModel(
                  action: 'Actualizar activo',
                  desc:
                      'Actualiz?? un producto activo. [C??digo: ${widget.productModel.code}, Nombre: ${widget.productModel.name}]',
                  date: DateTime.now().toString().substring(0, 19),
                );
                context.read<LogBloc>().add(LogEvent.add(log: log));
                context
                    .read<ProductBloc>()
                    .add(ProductEvent.add(product: productModel));
                context.read<ProductBloc>().add(const ProductEvent.getActive());
                Navigator.pop(context);
                showSnackbar(
                  context,
                  Snackbar(
                    extended: true,
                    content: Text(
                        'Se actualiz?? correctamente el producto: ${productModel.name}.'),
                  ),
                );
              },
              child: const Text(
                'Actualizar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
