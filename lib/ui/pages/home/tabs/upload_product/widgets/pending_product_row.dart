import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigest/constants/constant.dart';
import 'package:sigest/data/models/log_model/log_model.dart';
import 'package:sigest/data/models/product_model/product_model.dart';
import 'package:sigest/domain/bloc/log/log_bloc.dart';
import 'package:sigest/domain/bloc/product/product_bloc.dart';
import 'package:sigest/ui/pages/home/tabs/upload_product/widgets/load_pending.dart';

class PendingProductRow extends StatefulWidget {
  final ProductModel productModel;
  final int index;

  const PendingProductRow(
      {super.key, required this.productModel, required this.index});

  @override
  State<PendingProductRow> createState() => _PendingProductRowState();
}

class _PendingProductRowState extends State<PendingProductRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.productModel.amount! <= 5
              ? Colors.red.withOpacity(0.3)
              : widget.productModel.amount! <= 10
                  ? Colors.yellow.withOpacity(0.4)
                  : widget.index % 2 == 0
                      ? Colors.grey.withOpacity(0.2)
                      : Colors.white),
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * codeWidthCol,
            child: Text(
              widget.productModel.code.toString(),
              textAlign: TextAlign.center,
              style: styleTextProductRow,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * nameWidthCol,
            child: Text(
              widget.productModel.name,
              textAlign: TextAlign.center,
              style: styleTextProductRow,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * amountWidthCol,
            child: Text(
              widget.productModel.amount.toString(),
              textAlign: TextAlign.center,
              style: styleTextProductRow,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * buttonsWidthCol,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Tooltip(
                  message: 'Agregar producto pendiente',
                  child: FilledButton(
                    style: ButtonStyle(
                        backgroundColor: ButtonState.all<Color?>(Colors.green)),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return LoadPending(
                              productModel: widget.productModel,
                            );
                          });
                    },
                    child: const Icon(FluentIcons.add),
                  ),
                ),
                Tooltip(
                  message: 'Eliminar producto pendiente',
                  child: FilledButton(
                    style: ButtonStyle(
                        backgroundColor: ButtonState.all<Color?>(Colors.red)),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ContentDialog(
                            title: const Text(
                                '¿Esta seguro que desea eliminar este producto?',
                                textAlign: TextAlign.center),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Código: ${widget.productModel.code}'),
                                Text('Nombre: ${widget.productModel.name}'),
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
                                    action: 'Eliminar pendiente',
                                    desc:
                                        'Eliminó el producto pendiente. [Código: ${widget.productModel.code}, Nombre: ${widget.productModel.name}]',
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
                                      .add(const ProductEvent.getPending());
                                  Navigator.pop(context);
                                  showSnackbar(
                                    context,
                                    Snackbar(
                                      extended: true,
                                      content: Text(
                                          'Se eliminó correctamente el producto pendiente: ${widget.productModel.name}.'),
                                    ),
                                  );
                                },
                              ),
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
}
