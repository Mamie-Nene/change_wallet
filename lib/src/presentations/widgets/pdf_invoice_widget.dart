import 'dart:io';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

import '../../Utils/consts/app_specifications/allDirectories.dart';
import '../../data/local/pdf_api.dart';
import '../../domain/local/Invoice_Info /Customer.dart';
import '../../domain/local/Invoice_Info /Invoice.dart';
import '../../domain/local/Invoice_Info /Supplier.dart';





class PdfInvoiceWidget{

//----- generation -----
  static Future<File> generate(Invoice invoice) async {
    //transform our logo data en byte
    final ByteData logo = await rootBundle.load(AppImages.LOGO_GAINDE);
    Uint8List logoData = (logo).buffer.asUint8List();

    //create our pdf document
    final pdf = Document();

// building our pdf pages
    pdf.addPage(
        pw.Page(
            build: (context) {
              return pw.Column(
                  children: [
                    buildHeader(invoice,logoData),
                    SizedBox(height: 3 * PdfPageFormat.cm),
                    buildTitle(),
                    buildCustomerAddress(invoice.customer,invoice),
                    Divider(thickness: 1,),
                    buildInvoice(invoice),
                    Divider(),
                    buildTotal(invoice),
                    buildFooter(),
                  ]
              );
            }
        )
    );

    //for multiple pages
    /* pdf.addPage(MultiPage(
      build: (context) => [
        buildHeader(invoice),
        SizedBox(height: 3 * PdfPageFormat.cm),
        buildTitle(invoice),
        buildInvoice(invoice),
        Divider(),
        buildTotal(invoice),
      ],
      footer: (context) => buildFooter(invoice),
    ));*/

    // to save the pdf document
    return PdfApi.saveDocument(name: 'Reçu_E-Wallet.pdf', pdf: pdf);
  }


  static Widget buildHeader(Invoice invoice, Uint8List byteListForLogo ) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(height: 1 * PdfPageFormat.cm),
        //main header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // buildSupplierAddress(invoice.supplier),
            SizedBox(
                width: 105,
                height: AppDimensions.sizeboxHeight50,
                child:pw.Image(
                    pw.MemoryImage(byteListForLogo )
                )
            ),

            Container(
              height: 50,
              width: 50,
              child: BarcodeWidget(
                barcode: Barcode.qrCode(),
                data: invoice.info.number,
              ),
            ),
          ],
        ),
        SizedBox(height: 1 * PdfPageFormat.cm),
        //sub header
        Row(
          //crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // buildCustomPaint(),
            /*buildCustomPaintWithContainer(),
              pw.SizedBox(width: 10),*/
            Text(AppText.TITLE_INVOICE_TEXT,
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            // pw.SizedBox(width: 10),
            // buildCustomPaintWithContainerBis(),
            // buildCustomerAddress(invoice.customer),
            // buildInvoiceInfo(invoice.info),
          ],
        ),
      ],
    );
  }

  static pw.Widget buildCustomPaint() {
    final paint = pw.CustomPaint(
        painter: (PdfGraphics canvas, PdfPoint size) {
          /*Offset start = Offset(0, size.y / 2);
          Offset end = Offset(size.x, size.y / 2);*/
          canvas
            ..setStrokeColor(PdfColors.black)
            ..setColor(PdfColors.yellow)
          //..drawLine(start, end, paint);
            ..drawRRect(0, 0, 85 * PdfPageFormat.mm, 55 * PdfPageFormat.mm, 6, 6);
        });

    return paint;
  }

  static pw.Widget buildCustomPaintWithContainer() {
    return pw.Container(

      decoration: pw.BoxDecoration(
        borderRadius:
        const pw.BorderRadius.all(pw.Radius.circular(2)),
        color:PdfColors.yellow,
      ),
      padding: const pw.EdgeInsets.only(
          left: 250, top: 10, bottom: 10, right: 20),
      alignment: pw.Alignment.centerLeft,
      height: 50,
    );
  }

  static pw.Widget buildCustomPaintWithContainerBis() {
    return pw.Container(
      decoration: pw.BoxDecoration(
        borderRadius:
        const pw.BorderRadius.all(pw.Radius.circular(2)),
        color:PdfColors.yellow,
      ),
      padding: const pw.EdgeInsets.only(
          left: 50, top: 10, bottom: 10, right: 20),
      alignment: pw.Alignment.centerLeft,
      height: 50,
    );
  }

  static Widget buildCustomerAddress(Customer customer,Invoice invoice) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Nom',
                  style: TextStyle(
                      fontWeight: FontWeight.bold)
              ),
              Text(customer.name),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Date',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,)
              ),
              Text( Utils.formatDate(invoice.info.date)),
              //Text(invoice.info.date.toString()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Adresse',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,)
              ),
              Text(customer.address),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Numéro Recu ',style: TextStyle(
                fontWeight: FontWeight.bold,)
              ),
              Text(invoice.info.number),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mode de paiement ',style: TextStyle(
                fontWeight: FontWeight.bold,)
              ),
              Text(invoice.info.moyenPaiement,),
            ],
          ),
        ],
      );

  static Widget buildInvoiceInfo(InvoiceInfo info) {
    final titles = <String>[
      'Invoice Number:',
      'Invoice Date:',
    ];
    final data = <String>[
      info.number,
      Utils.formatDate(info.date),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final value = data[index];

        return buildText(title: title, value: value, width: 200);
      }),
    );
  }

  static Widget buildSupplierAddress(Supplier supplier) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(supplier.name, style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 1 * PdfPageFormat.mm),
      Text(supplier.address),
    ],
  );

  static Widget buildTitle() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Facturé à',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 0.8 * PdfPageFormat.cm),
      /*Text(invoice.info.description),
      SizedBox(height: 0.8 * PdfPageFormat.cm),*/
    ],
  );

  static Widget buildInvoice(Invoice invoice) {
    final headers = [
      'Origine Paiement',
      'Référence Paiement',
      'Montant',
      'Date',

    ];
    final data = invoice.items.map((item) {

      return [
        item.service,
        item.refFacture,
        '${item.montant.toStringAsFixed(0)} FCFA',
        Utils.formatDate(item.date),
        //item.date.toLocal()
        // Utils.formatDate(item.date),
        // Utils.formatDateLocal(item.date),
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColor.fromInt(0xfffb8500)),
      // headerDecoration: BoxDecoration(color: PdfColor.fromInt(0xff37517E)),
      // headerDecoration: BoxDecoration(color: PdfColors.yellow),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerRight,//centerLeft
        1: Alignment.centerRight, //right
        2: Alignment.centerRight,
        3: Alignment.centerRight,//right
      },
    );
  }

  static Widget buildTotal(Invoice invoice) {
    final netTotal = invoice.items
        .map((item) => item.montant )
        .reduce((item1, item2) => item1 + item2);

    final total = netTotal;

    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                  title: 'Total',
                  titleStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  value: Utils.formatPrice(total),
                  unite: true,
                ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildFooter() =>
      Padding(padding: const EdgeInsets.only(top: 50),
          child:
          Center(
            child: buildSimpleText(title: '', value:AppText.FOOTER_INVOICE_TEXT),
          ));

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value,),
      ],
    );
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }
}

class Utils {
  static formatPrice(double price) => '${price.toStringAsFixed(2)} XOF';
  static formatDate(DateTime date) => DateFormat.yMMMd().format(date);
}
/*class Utils {

  static formatPrice(double price) => '\$ ${price.toStringAsFixed(2)}';
  static formatDate(DateTime date) => DateFormat.format(date);
  /*static formatDateLocal(DateTime date)=>
      initializeDateFormatting("fr_CA", '').then((_) {
  print(DateFormat.yMd('fr_CA').format(date).toString());
  });*/

}*/
/*class UtilsBis {

  static formatPrice(double price) => '\$ ${price.toStringAsFixed(2)}';
  static formatDate(DateTime date) => DateFormat.yMMM().format(date);
  static formatDateLocal(DateTime date){
  try{
      initializeDateFormatting('fr_CA', '').then((_) => print(
      DateFormat.yMd('fr_CA').format(date).toString()
  ));}
          catch(e){print(e.toString());}
  }

}*/