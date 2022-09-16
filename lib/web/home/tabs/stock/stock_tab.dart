import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigest/constants/constant.dart';
import 'package:sigest/data/models/user_model/user_model.dart';
import 'package:sigest/web/domain/bloc/product/product_bloc.dart';

import 'widgets/all_product_pdf_view.dart';
import 'widgets/const_product_row.dart';
import 'widgets/product_row.dart';

class StockTab extends StatefulWidget {
  final UserModel userModel;

  const StockTab({super.key, required this.userModel});

  @override
  State<StockTab> createState() => _StockTabState();
}

class _StockTabState extends State<StockTab> {
  @override
  Widget build(BuildContext context) {
    String? comboBoxValue;
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Container(
          child: state.maybeWhen(
              loaded: (productList) {
                return ScaffoldPage(
                  header: Column(
                    children: [
                      const PageHeader(
                        title: Text('Stock'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue)),
                            margin:
                                const EdgeInsets.only(right: 20, bottom: 20),
                            child: Combobox<String>(
                              placeholder: const Text(
                                'Ordenar por:',
                                style: TextStyle(color: Colors.black),
                              ),
                              isExpanded: true,
                              items: valuesComboBox
                                  .map((e) => ComboboxItem<String>(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList(),
                              value: comboBoxValue,
                              onChanged: (value) {
                                context
                                    .read<ProductBloc>()
                                    .add(ProductEvent.getActive(sort: value));
                                print(value);
                                if (value != null) {
                                  setState(() {
                                    comboBoxValue = value;
                                  });
                                }
                              },
                            ),
                          ),
                          Button(
                            child: Image.asset(
                              'assets/images/pdf.png',
                              fit: BoxFit.cover,
                              width: 18,
                            ),
                            onPressed: () {
                              //imprimir pdf
                              Navigator.push(
                                context,
                                FluentPageRoute(
                                  builder: (context) => AllProductPdfView(
                                    userModel: widget.userModel,
                                    productsList: productList,
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                      const ConstProductRow(),
                      const Divider(
                        style: DividerThemeData(
                            decoration: BoxDecoration(color: Colors.white)),
                      ),
                    ],
                  ),
                  content: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            itemCount: productList!.length,
                            itemBuilder: (context, index) {
                              return ProductRow(
                                userModel: widget.userModel,
                                productModel: productList[index]!,
                                index: index,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                style: DividerThemeData(
                                    decoration:
                                        BoxDecoration(color: Colors.white)),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              loading: () => const Center(child: ProgressBar()),
              orElse: () => const ProgressBar()),
        );
      },
    );
  }
}
