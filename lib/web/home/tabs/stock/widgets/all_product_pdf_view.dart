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
                //mainAxisAlignment: pw.MainAxisAlignment.center,
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
                  pw.Container(child: pw.Image(image, width: 50)),
                  pw.Text(widget.userModel.name,
                      style: const pw.TextStyle(fontSize: 10)),
                  //pw.Expanded(child: pw.Container()),
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
                        itemCount: widget.productsList!.length,
                        itemBuilder: (context, index) {
                          return pw.Container(
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(),
                            ),
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              mainAxisSize: pw.MainAxisSize.max,
                              children: [
                                _valuePropertiesRow(
                                  value: widget.productsList![index]!.code
                                      .toString(),
                                  widthColumn: 0.03,
                                ),
                                _valuePropertiesRow(
                                  value: widget.productsList![index]!.name
                                      .toString(),
                                  widthColumn: 0.05,
                                ),
                                _valuePropertiesRow(
                                  value: widget.productsList![index]!.desc
                                      .toString(),
                                  widthColumn: 0.05,
                                ),
                                _valuePropertiesRow(
                                  value: widget.productsList![index]!.amount
                                      .toString(),
                                  widthColumn: 0.03,
                                ),
                                _valuePropertiesRow(
                                  value: widget
                                      .productsList![index]!.purchasePrice
                                      .toString(),
                                  widthColumn: 0.03,
                                ),
                                _valuePropertiesRow(
                                  value: widget.productsList![index]!.price
                                      .toString(),
                                  widthColumn: 0.03,
                                ),
                                _valuePropertiesRow(
                                  value: widget.productsList![index]!.provider
                                      .toString(),
                                  widthColumn: 0.04,
                                ),
                                _valuePropertiesRow(
                                  value: widget.productsList![index]!.category
                                      .toString(),
                                  widthColumn: 0.04,
                                ),
                              ],
                            ),
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
                style: const pw.TextStyle(fontSize: 10),
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
      //height: MediaQuery.of(context).size.height * 0.09,
      decoration: pw.BoxDecoration(
        color: const PdfColor(1, 1, 1),
        //border: pw.Border.all(),
      ),
      child: pw.Text(
        value,
        style: const pw.TextStyle(fontSize: 9),
      ),
    );
  }
}
