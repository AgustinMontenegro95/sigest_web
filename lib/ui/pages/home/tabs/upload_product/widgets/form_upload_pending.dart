import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sigest/data/models/product_model/product_model.dart';
import 'package:sigest/ui/pages/home/widgets/custom_text_form.dart';

class FormUploadPending extends StatelessWidget {
  const FormUploadPending({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.product,
    required this.amountController,
    required this.descController,
    required this.purchasePriceController,
    required this.priceController,
    required this.providerController,
    required this.categoryController,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final ProductModel product;
  final TextEditingController amountController;
  final TextEditingController descController;
  final TextEditingController purchasePriceController;
  final TextEditingController priceController;
  final TextEditingController providerController;
  final TextEditingController categoryController;

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    bool isSmallerThanMobileLarge =
        ResponsiveWrapper.of(context).isSmallerThan('MOBILE_LARGE');
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Wrap(
              spacing: 50.0,
              runSpacing: 15.0,
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
                          text: product.code.toString(),
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
                          text: product.name,
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
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: [
              SizedBox(
                width: isSmallerThanMobileLarge ? widthSize : widthSize * 0.3,
                child: CustomTextFormBox(
                  controller: amountController,
                  label: 'Cantidad',
                  maxLength: 6,
                  isNumber: true,
                ),
              ),
              SizedBox(
                width: isSmallerThanMobileLarge ? widthSize : widthSize * 0.3,
                child: CustomTextFormBox(
                  controller: purchasePriceController,
                  label: 'Precio de compra',
                  maxLength: 10,
                  isNumber: true,
                ),
              ),
              SizedBox(
                width: isSmallerThanMobileLarge ? widthSize : widthSize * 0.3,
                child: CustomTextFormBox(
                  controller: priceController,
                  label: 'Precio de venta',
                  maxLength: 10,
                  isNumber: true,
                ),
              ),
            ],
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: [
              SizedBox(
                width: isSmallerThanMobileLarge ? widthSize : widthSize * 0.45,
                child: CustomTextFormBox(
                  controller: providerController,
                  label: 'Proveedor',
                  maxLength: 30,
                  isNumber: false,
                ),
              ),
              SizedBox(
                width: isSmallerThanMobileLarge ? widthSize : widthSize * 0.45,
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
    );
  }
}
