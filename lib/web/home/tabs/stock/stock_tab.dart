import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigest/constants/constant.dart';
import 'package:sigest/data/models/user_model/user_model.dart';
import 'package:sigest/web/domain/bloc/product/product_bloc.dart';
import 'package:sigest/web/home/tabs/stock/widgets/product_search.dart';

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
  final autoSuggestBox = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String? comboBoxValue;
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Container(
          child: state.maybeWhen(
              loaded: (productList) {
                // obtengo los nombres de los productos
                List<String> nameProductsList = [];
                for (var i = 0; i < productList!.length; i++) {
                  nameProductsList.add(productList[i]!.name);
                }
                //
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
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 15),
                                width: 400,
                                child: ProductSearch(
                                  nameProductsList: nameProductsList,
                                  userModel: widget.userModel,
                                  productList: productList,
                                ),
                              ),
                              Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(color: Colors.blue),
                                child: const Icon(
                                  FluentIcons.search,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
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
                          Tooltip(
                            message: 'Ver en PDF',
                            child: Button(
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
                            itemCount: productList.length,
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
