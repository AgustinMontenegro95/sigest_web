import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigest/data/models/user_model/user_model.dart';
import 'package:sigest/web/domain/bloc/product/product_bloc.dart';

import 'widgets/const_pending_product_row.dart';
import 'widgets/pending_product_row.dart';
import 'widgets/upload_product.dart';

class UploadTab extends StatefulWidget {
  final UserModel userModel;

  const UploadTab({super.key, required this.userModel});

  @override
  State<UploadTab> createState() => _UploadTabState();
}

class _UploadTabState extends State<UploadTab> {
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController purchasePriceController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController providerController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    codeController.dispose();
    nameController.dispose();
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
    return ScaffoldPage(
        header: const PageHeader(
          title: Text('Altas de productos'),
        ),
        content: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              UploadProduct(
                  codeController: codeController,
                  nameController: nameController,
                  amountController: amountController,
                  descController: descController,
                  purchasePriceController: purchasePriceController,
                  priceController: priceController,
                  providerController: providerController,
                  categoryController: categoryController),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  return Container(
                    child: state.maybeWhen(
                        loaded: (productList) {
                          return Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.only(
                                    left: 20, top: 20, bottom: 10),
                                child: const Text(
                                  "Pendientes",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const ConstPendingProductRow(),
                              const Divider(
                                style: DividerThemeData(
                                    decoration:
                                        BoxDecoration(color: Colors.white)),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: productList!.length,
                                  itemBuilder: (context, index) {
                                    return PendingProductRow(
                                      productModel: productList[index]!,
                                      index: index,
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      style: DividerThemeData(
                                          decoration: BoxDecoration(
                                              color: Colors.white)),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                        loading: () => const Center(child: ProgressBar()),
                        orElse: () => const ProgressBar()),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
