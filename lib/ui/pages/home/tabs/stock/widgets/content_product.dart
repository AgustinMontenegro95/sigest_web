import 'package:fluent_ui/fluent_ui.dart';
import 'package:sigest/data/models/product_model/product_model.dart';
import 'package:sigest/data/models/user_model/user_model.dart';
import 'package:sigest/ui/pages/home/tabs/stock/widgets/closed_button.dart';
import 'package:sigest/ui/pages/home/widgets/custom_text_form.dart';

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
            Tooltip(
              message: 'Ver en PDF',
              child: Button(
                child: Image.asset(
                  'assets/images/pdf.png',
                  fit: BoxFit.cover,
                  width: 30,
                ),
                onPressed: () {
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
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: ClosedButton(),
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
            CustomTextFormBox(
              controller: descController,
              label: 'Descripción',
              isNumber: false,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: CustomTextFormBox(
                    controller: amountController,
                    label: 'Cantidad',
                    maxLength: 6,
                    isNumber: true,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: CustomTextFormBox(
                    controller: purchasePriceController,
                    label: 'Precio de compra',
                    maxLength: 10,
                    isNumber: true,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: CustomTextFormBox(
                    controller: priceController,
                    label: 'Precio de venta',
                    maxLength: 10,
                    isNumber: true,
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
                    maxLength: 30,
                    isNumber: false,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: CustomTextFormBox(
                    controller: categoryController,
                    label: 'Categoria',
                    maxLength: 20,
                    isNumber: false,
                  ),
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
                  backgroundColor: ButtonState.all<Color?>(Colors.red),
                ),
                child: const Text(
                  'Cancelar',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).pop([false]);
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.20,
              child: Button(
                style: ButtonStyle(
                  backgroundColor: ButtonState.all<Color?>(Colors.green),
                ),
                child: const Text('Aceptar',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                onPressed: () {
                  if (desc != descController.text ||
                      amount != amountController.text ||
                      purchasePrice != purchasePriceController.text ||
                      price != priceController.text ||
                      provider != providerController.text ||
                      category != categoryController.text) {
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
                    Navigator.of(context).pop([true, productModel]);
                    /* } else {
                      print("error");
                    } */
                  } else {
                    Navigator.of(context).pop([false]);
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
