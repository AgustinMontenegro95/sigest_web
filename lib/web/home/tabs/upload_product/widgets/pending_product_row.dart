import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigest/constants/constant.dart';
import 'package:sigest/data/models/product_model/product_model.dart';
import 'package:sigest/web/domain/bloc/product/product_bloc.dart';
import 'package:sigest/web/home/tabs/upload_product/widgets/load_pending.dart';

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
          color: widget.index % 2 == 0
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
                FilledButton(
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
                FilledButton(
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
                                    backgroundColor:
                                        ButtonState.all<Color?>(Colors.green)),
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
                                context.read<ProductBloc>().add(
                                    ProductEvent.delete(
                                        nameProduct: widget.productModel.name));
                                context
                                    .read<ProductBloc>()
                                    .add(const ProductEvent.getPending());
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Icon(FluentIcons.delete),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}