import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigest/data/models/product_model/product_model.dart';
import 'package:sigest/data/models/user_model/user_model.dart';
import 'package:sigest/web/domain/bloc/product/product_bloc.dart';
import 'package:sigest/web/home/tabs/stock/widgets/custom_text_form.dart';

import 'product_pdf_view.dart';
import 'product_row.dart';

class ContentProduct extends StatelessWidget {
  final UserModel userModel;
  final ProductRow widget;
  final TextEditingController descController;
  final TextEditingController amountController;
  final TextEditingController purchasePriceController;
  final TextEditingController priceController;
  final TextEditingController providerController;
  final TextEditingController categoryController;

  const ContentProduct({
    super.key,
    required this.widget,
    required this.descController,
    required this.amountController,
    required this.purchasePriceController,
    required this.priceController,
    required this.providerController,
    required this.categoryController,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    String desc = descController.text;
    String amount = amountController.text;
    String purchasePrice = purchasePriceController.text;
    String price = priceController.text;
    String provider = providerController.text;
    String category = categoryController.text;
    return ContentDialog(
      constraints: const BoxConstraints(maxWidth: double.infinity),
      title: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.blue,
              width: 3.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Producto".toUpperCase(),
                style: TextStyle(fontSize: 35, color: Colors.blue)),
            Expanded(child: Container()),
            Button(
              child: Image.asset(
                'assets/images/pdf.png',
                fit: BoxFit.cover,
                width: 30,
              ),
              onPressed: () {
                //imprimir pdf
                Navigator.push(
                  context,
                  FluentPageRoute(
                    builder: (context) => ProductPdfView(
                      userModel: userModel,
                      productModel: ProductModel(
                          category: categoryController.text,
                          uId: widget.productModel.uId,
                          code: widget.productModel.code,
                          name: widget.productModel.name,
                          amount: int.parse(amountController.text),
                          state: widget.productModel.state,
                          desc: descController.text,
                          price: double.parse(priceController.text),
                          provider: providerController.text,
                          purchasePrice:
                              double.parse(purchasePriceController.text),
                          entryDate: widget.productModel.entryDate),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Button(
                child: Image.asset(
                  'assets/images/close_icon.png',
                  fit: BoxFit.cover,
                  width: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Código: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        TextSpan(
                            text: widget.productModel.code.toString(),
                            style: const TextStyle(fontSize: 25)),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Nombre: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        TextSpan(
                            text: widget.productModel.name,
                            style: const TextStyle(fontSize: 25)),
                      ],
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
            CustomTextFormBox(controller: descController, label: 'Descripción'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: CustomTextFormBox(
                    controller: amountController,
                    label: 'Cantidad',
                    maxLength: 6,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: CustomTextFormBox(
                    controller: purchasePriceController,
                    label: 'Precio de compra',
                    maxLength: 10,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: CustomTextFormBox(
                    controller: priceController,
                    label: 'Precio de venta',
                    maxLength: 10,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: CustomTextFormBox(
                      controller: providerController,
                      label: 'Proveedor',
                      maxLength: 30),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: CustomTextFormBox(
                      controller: categoryController,
                      label: 'Categoria',
                      maxLength: 20),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Row(
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
                child: const Text('OK', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  if (desc != descController.text ||
                      amount != amountController.text ||
                      purchasePrice != purchasePriceController.text ||
                      price != priceController.text ||
                      provider != providerController.text ||
                      category != categoryController.text) {
                    //actualizacion correspon
                    ProductModel productModel = ProductModel(
                      uId: widget.productModel.name,
                      code: widget.productModel.code,
                      name: widget.productModel.name,
                      amount: int.parse(amountController.text),
                      state: true,
                      category: categoryController.text,
                      desc: descController.text,
                      price: double.parse(priceController.text),
                      purchasePrice: double.parse(purchasePriceController.text),
                      provider: providerController.text,
                      entryDate: widget.productModel.entryDate,
                    );
                    //if (_formKey.currentState!.validate()) {
                    context
                        .read<ProductBloc>()
                        .add(ProductEvent.add(product: productModel));
                    context
                        .read<ProductBloc>()
                        .add(const ProductEvent.getPending());
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
                    /* } else {
                      print("error");
                    } */
                  }
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
