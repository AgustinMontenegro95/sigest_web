import 'dart:html';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigest/data/models/product_model/product_model.dart';
import 'package:sigest/web/domain/bloc/product/product_bloc.dart';
import 'package:sigest/web/home/tabs/stock/widgets/custom_text_form.dart';

class UploadProduct extends StatelessWidget {
  UploadProduct({
    Key? key,
    required this.codeController,
    required this.nameController,
    required this.amountController,
    required this.descController,
    required this.purchasePriceController,
    required this.priceController,
    required this.providerController,
    required this.categoryController,
  }) : super(key: key);

  final TextEditingController codeController;
  final TextEditingController nameController;
  final TextEditingController amountController;
  final TextEditingController descController;
  final TextEditingController purchasePriceController;
  final TextEditingController priceController;
  final TextEditingController providerController;
  final TextEditingController categoryController;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Tooltip(
        message: "Click para agregar producto",
        child: Expander(
          headerBackgroundColor: ButtonState.all<Color>(Colors.blue.light),
          header: const Center(
            child: Text(
              "Agregar nuevo producto",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
          direction: ExpanderDirection.down,
          initiallyExpanded: true,
          content: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(30)),
            width: MediaQuery.of(context).size.width * 0.95,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: CustomTextFormBox(
                        controller: codeController,
                        label: 'Codigo',
                        maxLength: 15,
                        isNumber: true,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: CustomTextFormBox(
                        controller: nameController,
                        label: 'Nombre',
                        maxLength: 30,
                        isNumber: false,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: CustomTextFormBox(
                        controller: amountController,
                        label: 'Cantidad',
                        maxLength: 6,
                        isNumber: true,
                      ),
                    ),
                  ],
                ),
                CustomTextFormBox(
                  controller: descController,
                  label: 'Descripción',
                  isNumber: false,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: CustomTextFormBox(
                        controller: purchasePriceController,
                        label: 'Precio de compra',
                        maxLength: 10,
                        isNumber: true,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: CustomTextFormBox(
                        controller: priceController,
                        label: 'Precio de venta',
                        maxLength: 10,
                        isNumber: true,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.32,
                      child: CustomTextFormBox(
                        controller: providerController,
                        label: 'Proveedor',
                        maxLength: 30,
                        isNumber: false,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.23,
                      child: CustomTextFormBox(
                        controller: categoryController,
                        label: 'Categoria',
                        maxLength: 20,
                        isNumber: false,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: Tooltip(
                    message: 'Click para agregar un producto nuevo.',
                    child: Button(
                      style: ButtonStyle(
                        backgroundColor: ButtonState.all<Color?>(Colors.green),
                      ),
                      child: const Text('Cargar',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ProductModel productModel = ProductModel(
                            uId: nameController.text,
                            code: int.parse(codeController.text),
                            name: nameController.text,
                            amount: int.parse(amountController.text),
                            state: true,
                            category: categoryController.text,
                            desc: descController.text,
                            price: double.parse(priceController.text),
                            purchasePrice:
                                double.parse(purchasePriceController.text),
                            provider: providerController.text,
                            entryDate: DateTime.now().toString(),
                          );
                          context
                              .read<ProductBloc>()
                              .add(ProductEvent.add(product: productModel));
                          context
                              .read<ProductBloc>()
                              .add(const ProductEvent.getPending());
                          clearAllForm();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return ContentDialog(
                                title: const Text('SiGeSt'),
                                content: const Text(
                                    'Se agrego correctamente el producto.'),
                                actions: [
                                  Button(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              ButtonState.all<Color?>(
                                                  Colors.green)),
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
                                content: const Text(
                                    'Debes completar los campos solicitados.'),
                                actions: [
                                  Button(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              ButtonState.all<Color?>(
                                                  Colors.green)),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  clearAllForm() {
    codeController.clear();
    nameController.clear();
    amountController.clear();
    descController.clear();
    purchasePriceController.clear();
    priceController.clear();
    providerController.clear();
    categoryController.clear();
  }
}
