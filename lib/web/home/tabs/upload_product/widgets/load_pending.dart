import 'package:fluent_ui/fluent_ui.dart';

import 'package:sigest/data/models/product_model/product_model.dart';
import 'package:sigest/web/home/tabs/stock/widgets/closed_button.dart';

import 'package:sigest/web/home/tabs/upload_product/widgets/actions_upload.dart';
import 'package:sigest/web/home/tabs/upload_product/widgets/form_upload_pending.dart';

class LoadPending extends StatefulWidget {
  final ProductModel productModel;

  const LoadPending({super.key, required this.productModel});

  @override
  State<LoadPending> createState() => _LoadPendingState();
}

class _LoadPendingState extends State<LoadPending> {
  TextEditingController descController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController purchasePriceController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController providerController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  void initState() {
    amountController.text = widget.productModel.amount.toString();
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
            Text("Alta de producto pendiente".toUpperCase(),
                style: TextStyle(fontSize: 35, color: Colors.blue)),
            const Padding(
                padding: EdgeInsets.only(left: 30), child: ClosedButton()),
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: FormUploadPending(
            formKey: _formKey,
            product: widget.productModel,
            amountController: amountController,
            descController: descController,
            purchasePriceController: purchasePriceController,
            priceController: priceController,
            providerController: providerController,
            categoryController: categoryController),
      ),
      actions: [
        FormAction(
            product: widget.productModel,
            amountController: amountController,
            categoryController: categoryController,
            descController: descController,
            priceController: priceController,
            purchasePriceController: purchasePriceController,
            providerController: providerController,
            formKey: _formKey),
      ],
    );
  }
}
