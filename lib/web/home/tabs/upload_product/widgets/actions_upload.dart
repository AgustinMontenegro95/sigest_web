import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigest/data/models/log_model/log_model.dart';
import 'package:sigest/data/models/product_model/product_model.dart';
import 'package:sigest/domain/bloc/log/log_bloc.dart';
import 'package:sigest/web/domain/bloc/product/product_bloc.dart';

class FormAction extends StatelessWidget {
  const FormAction({
    Key? key,
    required this.product,
    required this.amountController,
    required this.categoryController,
    required this.descController,
    required this.priceController,
    required this.purchasePriceController,
    required this.providerController,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final ProductModel product;
  final TextEditingController amountController;
  final TextEditingController categoryController;
  final TextEditingController descController;
  final TextEditingController priceController;
  final TextEditingController purchasePriceController;
  final TextEditingController providerController;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.20,
          child: Button(
            style: ButtonStyle(
              backgroundColor: ButtonState.all<Color?>(Colors.green),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.20,
          child: Button(
            style: ButtonStyle(
              backgroundColor: ButtonState.all<Color?>(Colors.green),
            ),
            child: const Text('Cargar', style: TextStyle(color: Colors.white)),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                DateTime now = DateTime.now();
                ProductModel productModel = ProductModel(
                  uId: product.name,
                  code: product.code,
                  name: product.name,
                  amount: int.parse(amountController.text),
                  state: true,
                  category: categoryController.text,
                  desc: descController.text,
                  price: double.parse(priceController.text),
                  purchasePrice: double.parse(purchasePriceController.text),
                  provider: providerController.text,
                  entryDate: now.toString(),
                );
                final log = LogModel(
                    action: 'Cargar pendiente',
                    desc:
                        'Cargó un producto pendiente. [Código: ${product.code}, Nombre: ${product.name}]',
                    date:
                        '${now.day}/${now.month}/${now.year} - ${now.hour}:${now.minute < 10 ? '0${now.minute}' : now.minute}');
                context.read<LogBloc>().add(LogEvent.add(log: log));
                context
                    .read<ProductBloc>()
                    .add(ProductEvent.add(product: productModel));
                context
                    .read<ProductBloc>()
                    .add(const ProductEvent.getPending());
                clearAllForm();
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) {
                    return ContentDialog(
                      title: const Text('SiGeSt'),
                      content:
                          const Text('Se agrego correctamente el producto.'),
                      actions: [
                        Button(
                            style: ButtonStyle(
                                backgroundColor:
                                    ButtonState.all<Color?>(Colors.green)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Aceptar',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    );
                  },
                );
              } else {
                showDialog(
                  context: context,
                  builder: (context) {
                    return ContentDialog(
                      title: const Text('SiGeSt'),
                      content:
                          const Text('Debes completar los campos solicitados.'),
                      actions: [
                        Button(
                            style: ButtonStyle(
                                backgroundColor:
                                    ButtonState.all<Color?>(Colors.green)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Aceptar',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }

  clearAllForm() {
    amountController.clear();
    descController.clear();
    purchasePriceController.clear();
    priceController.clear();
    providerController.clear();
    categoryController.clear();
  }
}
