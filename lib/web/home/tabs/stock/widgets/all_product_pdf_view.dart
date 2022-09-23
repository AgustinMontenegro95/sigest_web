import 'dart:typed_data';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:sigest/data/models/product_model/product_model.dart';
import 'package:sigest/data/models/user_model/user_model.dart';

class AllProductPdfView extends StatefulWidget {
  final UserModel userModel;
  final List<ProductModel?>? productsList;

  const AllProductPdfView(
      {super.key, required this.userModel, required this.productsList});

  @override
  State<AllProductPdfView> createState() => _AllProductPdfViewState();
}

class _AllProductPdfViewState extends State<AllProductPdfView> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      build: (format) => _generatePdf(format),
      maxPageWidth: MediaQuery.of(context).size.width * 0.7,
      canDebug: false,
      canChangePageFormat: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Button(
            child: const Text(
              "Volver",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
      pdfFileName:
          'Stock_${widget.userModel.name}_${date.toString().substring(0, 10)}',
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    List<ProductModel?>? page1 = [];
    List<ProductModel?>? page2 = [];
    List<ProductModel?>? page3 = [];
    List<ProductModel?>? page4 = [];
    List<ProductModel?>? page5 = [];
    List<ProductModel?>? page6 = [];
    List<ProductModel?>? page7 = [];
    List<ProductModel?>? page8 = [];
    List<ProductModel?>? page9 = [];
    List<ProductModel?>? page10 = [];

    for (var i = 0; i < widget.productsList!.length; i++) {
      if (i < 18) {
        page1.add(widget.productsList![i]);
      } else if (i < 42) {
        page2.add(widget.productsList![i]);
      } else if (i < 66) {
        page3.add(widget.productsList![i]);
      } else if (i < 90) {
        page4.add(widget.productsList![i]);
      } else if (i < 114) {
        page5.add(widget.productsList![i]);
      } else if (i < 138) {
        page6.add(widget.productsList![i]);
      } else if (i < 162) {
        page7.add(widget.productsList![i]);
      } else if (i < 186) {
        page8.add(widget.productsList![i]);
      } else if (i < 210) {
        page9.add(widget.productsList![i]);
      } else if (i < 234) {
        page10.add(widget.productsList![i]);
      }
    }

    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    String formattedDate = date.toString().substring(0, 19);
    final image = await imageFromAssetBundle('assets/images/icon/icon.png');
    final logo = pw.Image(image);

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (contextPage) {
          return pw.Container(
              padding: const pw.EdgeInsets.symmetric(vertical: 20),
              decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
              child: pw.Column(
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      pw.Text('Informe emitido por SiGeSt',
                          style: const pw.TextStyle(fontSize: 10)),
                      pw.Text(formattedDate,
                          style: const pw.TextStyle(fontSize: 10)),
                    ],
                  ),
                  pw.SizedBox(height: 30),
                  pw.Container(
                    padding: const pw.EdgeInsets.all(10),
                    decoration: pw.BoxDecoration(
                        color: const PdfColor(
                          0.2,
                          0.2,
                          0.2,
                        ),
                        borderRadius: pw.BorderRadius.circular(30)),
                    child: pw.Image(image, width: 50),
                  ),
                  pw.Text(widget.userModel.name,
                      style: pw.TextStyle(
                          fontSize: 10, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 30),
                  pw.Column(
                    children: [
                      pw.Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(),
                            color: const PdfColor(
                              0.6,
                              0.6,
                              0.6,
                            ),
                          ),
                          child: pw.Text('LISTA DE PRODUCTOS',
                              style: const pw.TextStyle(fontSize: 20),
                              textAlign: pw.TextAlign.center)),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        mainAxisSize: pw.MainAxisSize.max,
                        children: [
                          _productPropertiesRow(
                            title: 'Código',
                            widthColumn: 0.03,
                          ),
                          _productPropertiesRow(
                            title: 'Nombre',
                            widthColumn: 0.05,
                          ),
                          _productPropertiesRow(
                            title: 'Descripción',
                            widthColumn: 0.05,
                          ),
                          _productPropertiesRow(
                            title: 'Cantidad',
                            widthColumn: 0.03,
                          ),
                          _productPropertiesRow(
                            title: 'Precio compra',
                            widthColumn: 0.03,
                          ),
                          _productPropertiesRow(
                            title: 'Precio venta',
                            widthColumn: 0.03,
                          ),
                          _productPropertiesRow(
                            title: 'Proveedor',
                            widthColumn: 0.04,
                          ),
                          _productPropertiesRow(
                            title: 'Categoria',
                            widthColumn: 0.04,
                          ),
                        ],
                      ),
                      pw.ListView.builder(
                        itemCount: page1.length,
                        itemBuilder: (context, index) {
                          return pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            mainAxisSize: pw.MainAxisSize.max,
                            children: [
                              _valuePropertiesRow(
                                value: page1[index]!.code.toString(),
                                widthColumn: 0.03,
                              ),
                              _valuePropertiesRow(
                                value: page1[index]!.name.toString(),
                                widthColumn: 0.05,
                              ),
                              _valuePropertiesRow(
                                value: page1[index]!.desc.toString(),
                                widthColumn: 0.05,
                              ),
                              _valuePropertiesRow(
                                value: page1[index]!.amount.toString(),
                                widthColumn: 0.03,
                              ),
                              _valuePropertiesRow(
                                value: page1[index]!.purchasePrice.toString(),
                                widthColumn: 0.03,
                              ),
                              _valuePropertiesRow(
                                value: page1[index]!.price.toString(),
                                widthColumn: 0.03,
                              ),
                              _valuePropertiesRow(
                                value: page1[index]!.provider.toString(),
                                widthColumn: 0.04,
                              ),
                              _valuePropertiesRow(
                                value: page1[index]!.category.toString(),
                                widthColumn: 0.04,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  pw.Expanded(child: pw.Container()),
                  pw.Center(
                    child: pw.Text('Pág. 1',
                        style: const pw.TextStyle(fontSize: 10)),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      pw.Text('Informe emitido por SiGeSt',
                          style: const pw.TextStyle(fontSize: 10)),
                      pw.Text(formattedDate,
                          style: const pw.TextStyle(fontSize: 10)),
                    ],
                  ),
                ],
              ));
        },
      ),
    );

    page2.isNotEmpty
        ? pdf.addPage(
            pw.Page(
              pageFormat: format,
              build: (contextPage) {
                return pw.Container(
                  padding: const pw.EdgeInsets.symmetric(vertical: 20),
                  decoration:
                      pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
                  child: pw.Column(
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                        children: [
                          pw.Text('Informe emitido por SiGeSt',
                              style: const pw.TextStyle(fontSize: 10)),
                          pw.Text(formattedDate,
                              style: const pw.TextStyle(fontSize: 10)),
                        ],
                      ),
                      pw.SizedBox(height: 30),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        mainAxisSize: pw.MainAxisSize.max,
                        children: [
                          _productPropertiesRow(
                            title: 'Código',
                            widthColumn: 0.03,
                          ),
                          _productPropertiesRow(
                            title: 'Nombre',
                            widthColumn: 0.05,
                          ),
                          _productPropertiesRow(
                            title: 'Descripción',
                            widthColumn: 0.05,
                          ),
                          _productPropertiesRow(
                            title: 'Cantidad',
                            widthColumn: 0.03,
                          ),
                          _productPropertiesRow(
                            title: 'Precio compra',
                            widthColumn: 0.03,
                          ),
                          _productPropertiesRow(
                            title: 'Precio venta',
                            widthColumn: 0.03,
                          ),
                          _productPropertiesRow(
                            title: 'Proveedor',
                            widthColumn: 0.04,
                          ),
                          _productPropertiesRow(
                            title: 'Categoria',
                            widthColumn: 0.04,
                          ),
                        ],
                      ),
                      pw.ListView.builder(
                        itemCount: page2.length,
                        itemBuilder: (context, index) {
                          return pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            mainAxisSize: pw.MainAxisSize.max,
                            children: [
                              _valuePropertiesRow(
                                value: page2[index]!.code.toString(),
                                widthColumn: 0.03,
                              ),
                              _valuePropertiesRow(
                                value: page2[index]!.name.toString(),
                                widthColumn: 0.05,
                              ),
                              _valuePropertiesRow(
                                value: page2[index]!.desc.toString(),
                                widthColumn: 0.05,
                              ),
                              _valuePropertiesRow(
                                value: page2[index]!.amount.toString(),
                                widthColumn: 0.03,
                              ),
                              _valuePropertiesRow(
                                value: page2[index]!.purchasePrice.toString(),
                                widthColumn: 0.03,
                              ),
                              _valuePropertiesRow(
                                value: page2[index]!.price.toString(),
                                widthColumn: 0.03,
                              ),
                              _valuePropertiesRow(
                                value: page2[index]!.provider.toString(),
                                widthColumn: 0.04,
                              ),
                              _valuePropertiesRow(
                                value: page2[index]!.category.toString(),
                                widthColumn: 0.04,
                              ),
                            ],
                          );
                        },
                      ),
                      pw.Expanded(child: pw.Container()),
                      pw.Center(
                        child: pw.Text('Pág. 2',
                            style: const pw.TextStyle(fontSize: 10)),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                        children: [
                          pw.Text('Informe emitido por SiGeSt',
                              style: const pw.TextStyle(fontSize: 10)),
                          pw.Text(formattedDate,
                              style: const pw.TextStyle(fontSize: 10)),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        : null;

    page3.isNotEmpty
        ? pdf.addPage(
            pw.Page(
              pageFormat: format,
              build: (contextPage) {
                return pw.Container(
                  padding: const pw.EdgeInsets.symmetric(vertical: 20),
                  decoration:
                      pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
                  child: pw.Column(
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                        children: [
                          pw.Text('Informe emitido por SiGeSt',
                              style: const pw.TextStyle(fontSize: 10)),
                          pw.Text(formattedDate,
                              style: const pw.TextStyle(fontSize: 10)),
                        ],
                      ),
                      pw.SizedBox(height: 30),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        mainAxisSize: pw.MainAxisSize.max,
                        children: [
                          _productPropertiesRow(
                            title: 'Código',
                            widthColumn: 0.03,
                          ),
                          _productPropertiesRow(
                            title: 'Nombre',
                            widthColumn: 0.05,
                          ),
                          _productPropertiesRow(
                            title: 'Descripción',
                            widthColumn: 0.05,
                          ),
                          _productPropertiesRow(
                            title: 'Cantidad',
                            widthColumn: 0.03,
                          ),
                          _productPropertiesRow(
                            title: 'Precio compra',
                            widthColumn: 0.03,
                          ),
                          _productPropertiesRow(
                            title: 'Precio venta',
                            widthColumn: 0.03,
                          ),
                          _productPropertiesRow(
                            title: 'Proveedor',
                            widthColumn: 0.04,
                          ),
                          _productPropertiesRow(
                            title: 'Categoria',
                            widthColumn: 0.04,
                          ),
                        ],
                      ),
                      pw.ListView.builder(
                        itemCount: page3.length,
                        itemBuilder: (context, index) {
                          return pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            mainAxisSize: pw.MainAxisSize.max,
                            children: [
                              _valuePropertiesRow(
                                value: page3[index]!.code.toString(),
                                widthColumn: 0.03,
                              ),
                              _valuePropertiesRow(
                                value: page3[index]!.name.toString(),
                                widthColumn: 0.05,
                              ),
                              _valuePropertiesRow(
                                value: page3[index]!.desc.toString(),
                                widthColumn: 0.05,
                              ),
                              _valuePropertiesRow(
                                value: page3[index]!.amount.toString(),
                                widthColumn: 0.03,
                              ),
                              _valuePropertiesRow(
                                value: page3[index]!.purchasePrice.toString(),
                                widthColumn: 0.03,
                              ),
                              _valuePropertiesRow(
                                value: page3[index]!.price.toString(),
                                widthColumn: 0.03,
                              ),
                              _valuePropertiesRow(
                                value: page3[index]!.provider.toString(),
                                widthColumn: 0.04,
                              ),
                              _valuePropertiesRow(
                                value: page3[index]!.category.toString(),
                                widthColumn: 0.04,
                              ),
                            ],
                          );
                        },
                      ),
                      pw.Expanded(child: pw.Container()),
                      pw.Center(
                        child: pw.Text('Pág. 3',
                            style: const pw.TextStyle(fontSize: 10)),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                        children: [
                          pw.Text('Informe emitido por SiGeSt',
                              style: const pw.TextStyle(fontSize: 10)),
                          pw.Text(formattedDate,
                              style: const pw.TextStyle(fontSize: 10)),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        : null;

    page4.isNotEmpty
        ? pdf.addPage(
            pw.Page(
              pageFormat: format,
              build: (contextPage) {
                return pw.Container(
                  padding: const pw.EdgeInsets.symmetric(vertical: 20),
                  decoration:
                      pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
                  child: pw.Column(
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                        children: [
                          pw.Text('Informe emitido por SiGeSt',
                              style: const pw.TextStyle(fontSize: 10)),
                          pw.Text(formattedDate,
                              style: const pw.TextStyle(fontSize: 10)),
                        ],
                      ),
                      pw.SizedBox(height: 30),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        mainAxisSize: pw.MainAxisSize.max,
                        children: [
                          _productPropertiesRow(
                            title: 'Código',
                            widthColumn: 0.03,
                          ),
                          _productPropertiesRow(
                            title: 'Nombre',
                            widthColumn: 0.05,
                          ),
                          _productPropertiesRow(
                            title: 'Descripción',
                            widthColumn: 0.05,
                          ),
                          _productPropertiesRow(
                            title: 'Cantidad',
                            widthColumn: 0.03,
                          ),
                          _productPropertiesRow(
                            title: 'Precio compra',
                            widthColumn: 0.03,
                          ),
                          _productPropertiesRow(
                            title: 'Precio venta',
                            widthColumn: 0.03,
                          ),
                          _productPropertiesRow(
                            title: 'Proveedor',
                            widthColumn: 0.04,
                          ),
                          _productPropertiesRow(
                            title: 'Categoria',
                            widthColumn: 0.04,
                          ),
                        ],
                      ),
                      pw.ListView.builder(
                        itemCount: page4.length,
                        itemBuilder: (context, index) {
                          return pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            mainAxisSize: pw.MainAxisSize.max,
                            children: [
                              _valuePropertiesRow(
                                value: page4[index]!.code.toString(),
                                widthColumn: 0.03,
                              ),
                              _valuePropertiesRow(
                                value: page4[index]!.name.toString(),
                                widthColumn: 0.05,
                              ),
                              _valuePropertiesRow(
                                value: page4[index]!.desc.toString(),
                                widthColumn: 0.05,
                              ),
                              _valuePropertiesRow(
                                value: page4[index]!.amount.toString(),
                                widthColumn: 0.03,
                              ),
                              _valuePropertiesRow(
                                value: page4[index]!.purchasePrice.toString(),
                                widthColumn: 0.03,
                              ),
                              _valuePropertiesRow(
                                value: page4[index]!.price.toString(),
                                widthColumn: 0.03,
                              ),
                              _valuePropertiesRow(
                                value: page4[index]!.provider.toString(),
                                widthColumn: 0.04,
                              ),
                              _valuePropertiesRow(
                                value: page4[index]!.category.toString(),
                                widthColumn: 0.04,
                              ),
                            ],
                          );
                        },
                      ),
                      pw.Expanded(child: pw.Container()),
                      pw.Center(
                        child: pw.Text('Pág. 4',
                            style: const pw.TextStyle(fontSize: 10)),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                        children: [
                          pw.Text('Informe emitido por SiGeSt',
                              style: const pw.TextStyle(fontSize: 10)),
                          pw.Text(formattedDate,
                              style: const pw.TextStyle(fontSize: 10)),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        : null;
    return pdf.save();
  }

  _productPropertiesRow({required String title, required double widthColumn}) {
    return pw.Container(
      decoration: pw.BoxDecoration(
        border: pw.Border.all(),
        color: const PdfColor(
          0.9,
          0.9,
          0.9,
        ),
      ),
      child: pw.Row(
        mainAxisSize: pw.MainAxisSize.min,
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: [
          pw.Container(
            padding: const pw.EdgeInsets.all(3),
            width: MediaQuery.of(context).size.width * widthColumn,
            height: MediaQuery.of(context).size.height * 0.04,
            child: pw.Center(
              child: pw.Text(
                title,
                textAlign: pw.TextAlign.center,
                style:
                    pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _valuePropertiesRow({required String value, required double widthColumn}) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(3),
      width: MediaQuery.of(context).size.width * widthColumn,
      height: MediaQuery.of(context).size.width * 0.015,
      decoration: pw.BoxDecoration(
        color: const PdfColor(1, 1, 1),
        border: pw.Border.all(),
      ),
      child: pw.Center(
        child: pw.Text(
          value,
          maxLines: 2,
          textAlign: pw.TextAlign.center,
          style: const pw.TextStyle(fontSize: 8),
        ),
      ),
    );
  }
}
