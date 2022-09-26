import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigest/data/models/log_model/log_model.dart';
import 'package:sigest/data/models/product_model/product_model.dart';
import 'package:sigest/data/models/user_model/user_model.dart';
import 'package:sigest/domain/bloc/log/log_bloc.dart';
import 'package:sigest/web/home/tabs/stock/widgets/closed_button.dart';
import 'package:sigest/web/home/tabs/stock/widgets/product_attribute.dart';
import 'package:sigest/web/home/tabs/stock/widgets/product_pdf_view.dart';

class ProductSearch extends StatelessWidget {
  const ProductSearch(
      {super.key,
      required this.nameProductsList,
      required this.userModel,
      this.productList});

  final List<String> nameProductsList;
  final UserModel userModel;
  final List<ProductModel?>? productList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      child: AutoSuggestBox(
        clearButtonEnabled: true,
        placeholder: 'Buscar',
        placeholderStyle: const TextStyle(color: Colors.black),
        highlightColor: Colors.blue,
        cursorColor: Colors.black,
        items: nameProductsList,
        onSelected: (name) {
          ProductModel productModel = ProductModel(
              uId: "uId", code: 1, name: name, amount: 1, state: false);
          for (var i = 0; i < productList!.length; i++) {
            if (productList![i]!.name == name) {
              productModel = productList![i]!;
              break;
            }
          }
          final log = LogModel(
            action: 'Buscar producto',
            desc:
                'Buscó un producto. [Código: ${productModel.code}, Nombre: ${productModel.name}]',
            date: DateTime.now().toString().substring(0, 19),
          );
          context.read<LogBloc>().add(LogEvent.add(log: log));
          showDialog(
            context: context,
            builder: (context) {
              return ContentDialog(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.8),
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
                      Text("Resultado de la busqueda".toUpperCase(),
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
                                      category: productModel.category,
                                      uId: productModel.uId,
                                      code: productModel.code,
                                      name: productModel.name,
                                      amount: productModel.amount,
                                      state: productModel.state,
                                      desc: productModel.desc,
                                      price: productModel.price,
                                      provider: productModel.provider,
                                      purchasePrice: productModel.purchasePrice,
                                      entryDate: productModel.entryDate),
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
                            ProductAttribute(
                                attribute: 'Código: ',
                                value: productModel.code.toString()),
                            ProductAttribute(
                                attribute: 'Nombre: ',
                                value: productModel.name),
                            Container(),
                          ],
                        ),
                      ),
                      ProductAttribute(
                          attribute: 'Descripción: ',
                          value: productModel.desc!),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProductAttribute(
                                attribute: 'Cantidad: ',
                                value: productModel.amount.toString()),
                            ProductAttribute(
                                attribute: 'Precio de compra: ',
                                value: productModel.purchasePrice.toString()),
                            ProductAttribute(
                                attribute: 'Precio de venta: ',
                                value: productModel.price.toString()),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProductAttribute(
                              attribute: 'Proveedor: ',
                              value: productModel.provider!),
                          ProductAttribute(
                              attribute: 'Categoria: ',
                              value: productModel.category!),
                          Container(),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: [
                  Button(
                    style: ButtonStyle(
                        backgroundColor: ButtonState.all<Color?>(Colors.green)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Aceptar',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
