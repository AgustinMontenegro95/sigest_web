import 'dart:typed_data';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:sigest/data/models/product_model/product_model.dart';
import 'package:sigest/data/models/user_model/user_model.dart';

class ProductPdfView extends StatefulWidget {
  final UserModel userModel;
  final ProductModel productModel;

  const ProductPdfView(
      {super.key, required this.userModel, required this.productModel});

  @override
  State<ProductPdfView> createState() => _ProductPdfViewState();
}

class _ProductPdfViewState extends State<ProductPdfView> {
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
          '${widget.productModel.name}_${widget.userModel.name}_${date.toString().substring(0, 10)}',
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);

    String formattedDate = date.toString().substring(0, 19);
    final image = await imageFromAssetBundle('assets/images/icon/icon.png');
    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (contextPage) {
          return pw.Container(
              padding: const pw.EdgeInsets.all(20),
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
                          child: pw.Text('PRODUCTO',
                              style: const pw.TextStyle(fontSize: 20),
                              textAlign: pw.TextAlign.center)),
                      _productPropertiesRow(
                          title: 'Código',
                          value: widget.productModel.code.toString()),
                      _productPropertiesRow(
                          title: 'Nombre', value: widget.productModel.name),
                      _productPropertiesRow(
                          title: 'Descripción',
                          value: widget.productModel.desc!),
                      _productPropertiesRow(
                          title: 'Cantidad disponible',
                          value: widget.productModel.amount.toString()),
                      _productPropertiesRow(
                          title: 'Precio de compra',
                          value: widget.productModel.price.toString()),
                      _productPropertiesRow(
                          title: 'Precio de venta',
                          value: widget.productModel.purchasePrice.toString()),
                      _productPropertiesRow(
                          title: 'Proveedor',
                          value: widget.productModel.provider!),
                      _productPropertiesRow(
                          title: 'Categoria',
                          value: widget.productModel.category!),
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

  _productPropertiesRow({required String title, required String value}) {
    const widthColumn = 0.1;
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
              child: pw.Text(title, style: const pw.TextStyle(fontSize: 10)),
            ),
            pw.Container(
              padding: const pw.EdgeInsets.all(3),
              width: MediaQuery.of(context).size.width * widthColumn,
              decoration: pw.BoxDecoration(
                color: const PdfColor(1, 1, 1),
                border: pw.Border.all(),
              ),
              child: pw.Text(value, style: const pw.TextStyle(fontSize: 10)),
            ),
          ],
        ));
  }
}
