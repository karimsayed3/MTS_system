import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image/image.dart' as img;
import 'package:printing/printing.dart';

void createPdfReceipt() async {
  final doc = pw.Document();
  final customReceiptFormat = PdfPageFormat(100 * PdfPageFormat.mm,
      PdfPageFormat.a4.height * .6); // Adjust width and height as needed
  final img = await rootBundle.load('assets/images/logo-mk.png');
  final imageBytes = img.buffer.asUint8List();
  pw.Image logo = pw.Image(pw.MemoryImage(imageBytes));
  var data = await rootBundle.load("assets/fonts/din.ttf");
  var myFont = pw.Font.ttf(data);
  // Header section with logo and company info
  doc.addPage(pw.Page(
      pageFormat: customReceiptFormat,
      textDirection: pw.TextDirection.rtl,
      build: (context) {
        return pw.Padding(
          padding: const pw.EdgeInsets.all(5),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                alignment: pw.Alignment.center,
                height: 50,
                child: logo,
              ),
              pw.Divider(thickness: 1, height: 1),
              pw.Container(
                color: PdfColor.fromHex('#1E90FF'),
                padding: const pw.EdgeInsets.only(bottom: 5),
                child: pw.Center(
                  child: defaultTextInPW(
                      title: 'ايصال سداد فاتورة', myFont: myFont, fontSize: 16),
                ),
              ),
              // pw.Text('ايصال سداد فاتورة', style: pw.TextStyle(font: myFont)),
              pw.Table(
                border: pw.TableBorder.all(width: .5),
                columnWidths: {
                  0: const pw.FlexColumnWidth(1),
                  1: const pw.FlexColumnWidth(1),
                },
                children: [
                  pw.TableRow(
                    children: [
                      pw.Center(
                        child: pw.Text('', style: pw.TextStyle(font: myFont)),
                      ),
                      tableRowItem(
                        title: 'رقم الفاتورة',
                        myFont: myFont,
                      ),
                    ],
                  ),
                  pw.TableRow(
                    verticalAlignment: pw.TableCellVerticalAlignment.middle,
                    children: [
                      pw.Center(
                        child: pw.Text(
                            '${DateTime
                                .now()
                                .year}-${DateTime
                                .now()
                                .month}-${DateTime
                                .now()
                                .day}',
                            style: pw.TextStyle(font: myFont)),
                      ),
                      tableRowItem(
                        title: 'تاريخ الفاتورة',
                        myFont: myFont,
                      ),
                    ],
                  ),
                  pw.TableRow(
                    verticalAlignment: pw.TableCellVerticalAlignment.middle,
                    children: [
                      pw.Center(
                        child: pw.Text(
                            '01156788394', style: pw.TextStyle(font: myFont)),
                      ),
                      tableRowItem(
                        title: 'رقم التليفون',
                        myFont: myFont,
                      ),

                      // pw.Center(
                      //   child: pw.Text('رقم التليفون',
                      //       style: pw.TextStyle(font: myFont)),
                      // ),
                    ],
                  ),
                  pw.TableRow(
                    verticalAlignment: pw.TableCellVerticalAlignment.middle,
                    children: [
                      pw.Center(
                        child: pw.Text('', style: pw.TextStyle(font: myFont)),
                      ),
                      tableRowItem(
                        title: 'خطة الاسعار',
                        myFont: myFont,
                      ),

                      // pw.Center(
                      //   child: pw.Text('خطة الاسعار',
                      //       style: pw.TextStyle(font: myFont)),
                      // ),
                    ],
                  ),
                  pw.TableRow(
                    verticalAlignment: pw.TableCellVerticalAlignment.middle,
                    children: [
                      pw.Center(
                        child:
                        pw.Text('100', style: pw.TextStyle(font: myFont)),
                      ),
                      tableRowItem(
                        title: 'اجمالى قيمة الفاتورة المستحقة',
                        myFont: myFont,
                      ),

                      // pw.Center(
                      //   child: pw.Text(
                      //       'اجمالى قيمة الفاتورة المستحقة على الرقم',
                      //       style: pw.TextStyle(font: myFont, fontSize: 10)),
                      // ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Center(
                        child: pw.Text('', style: pw.TextStyle(font: myFont)),
                      ),
                      tableRowItem(
                        title: 'المبلغ المدفوع',
                        myFont: myFont,
                      ),

                      // pw.Center(
                      //   child: pw.Text('المبلغ المدفوع',
                      //       style: pw.TextStyle(font: myFont)),
                      // ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text('', style: pw.TextStyle(font: myFont)),
                      tableRowItem(
                        title: 'المتبقى بعد دفع الفاتورة',
                        myFont: myFont,
                      ),
                      //
                      // pw.Text('المتبقى بعد دفع الفاتورة',
                      //     style: pw.TextStyle(font: myFont)),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text('', style: pw.TextStyle(font: myFont)),
                      tableRowItem(
                        title: 'نوع التحصيل',
                        myFont: myFont,
                      ),

                      // pw.Text('نوع التحصيل', style: pw.TextStyle(font: myFont)),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text('', style: pw.TextStyle(font: myFont)),
                      tableRowItem(
                        title: 'المستلم',
                        myFont: myFont,
                      ),

                      // pw.Text('المستلم', style: pw.TextStyle(font: myFont)),
                    ],
                  ),
                  // Add more table rows for each order item
                ],
              ),
              // defaultTextInPW(title: 'عزيزى العميل برجاء الالتزام بالاتى:', myFont: myFont,fontSize: 12),
              pw.Text(
                'عزيزى العميل برجاء الالتزام بالاتى:',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 12,
                  decoration: pw.TextDecoration.underline,
                  font: myFont,
                ),
              ),
              defaultTextInPW(
                title:
                'الحساب الموضح عاليه حتى يوم ${DateTime
                    .now()
                    .day}/${DateTime
                    .now()
                    .month}/${DateTime
                    .now()
                    .year}',
                myFont: myFont,
              ),
              defaultTextInPW(
                title:
                '- دفع الفاتورة مقدما فور التجديد عن الشهر لتجنب وقف الخدمة من جانب الشركة',
                myFont: myFont,
              ),
              defaultTextInPW(
                title: '- تجديد الفاتورة ثابت شهريا يوم 11 من كل شهر ',
                myFont: myFont,
              ),
              defaultTextInPW(
                title:
                '- لتعديل الباقة / التحويل لنظام الكارت رجاءاً الإبلاغ قبل التجديد ب 10 ايام على الاقل',
                myFont: myFont,
              ),
              pw.Divider(
                  thickness: 1, height: 1, color: PdfColor.fromHex('#CDCDB4')),
              pw.Center(
                child: defaultTextInPW(
                    title:
                    'نسعد بخدمتكم دائما',
                    myFont: myFont,
                    fontSize: 14
                ),
              ),
              pw.Divider(
                  thickness: 1, height: 1, color: PdfColor.fromHex('#CDCDB4')),
              pw.Table(
                  border: pw.TableBorder.all(
                      width: .5, color: PdfColor.fromHex('#CDCDB4')),
                  columnWidths: {
                    0: const pw.FlexColumnWidth(1),
                    1: const pw.FlexColumnWidth(1),
                  },
                  children: [
                    pw.TableRow(
                        children: [
                          pw.Container(
                            padding: const pw.EdgeInsets.all(5),
                            child: defaultTextInPW(
                                title:
                                'للشكاوى والمقترحات واتس: 010000068505',
                                myFont: myFont,
                                fontSize: 8
                            ),
                          )
                          ,
                          pw.Container(
                            padding: const pw.EdgeInsets.all(5),
                            child: defaultTextInPW(
                                title:
                                'للتواصل واتس - فون رقم 064733347',
                                myFont: myFont,
                                fontSize: 8
                            ),
                          )
                        ]
                    )
                  ]
              ),

            ],
          ),
        );
      }));

  // final byteData = await doc.save();
  // const fileName = 'receipt.pdf';
  // final directory = await getDownloadsDirectory();
  // final filePath = '${directory!.path}/$fileName';

  // Write PDF data to the file
  // await File(filePath).writeAsBytes(byteData.buffer.asUint8List());
  // await File(filePath).writeAsBytes(await doc.save());
  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());
  // final filePath = await writeBytes(byteData, fileName);
  // Open the PDF document
  // OpenFile.open(filePath);
  // await  convertPDFtoImage(File(filePath));
}

tableRowItem({
  dynamic myFont,
  required String title,
}) {
  return pw.Container(
    color: PdfColor.fromHex("#EEDC82"),
    padding: const pw.EdgeInsets.all(5),
    child: pw.Center(
      child: pw.Text(title, style: pw.TextStyle(font: myFont, fontSize: 10)),
    ),
  );
}

defaultTextInPW({
  dynamic myFont,
  required String title,
  double fontSize = 10,
}) {
  return pw.Text(title, style: pw.TextStyle(font: myFont, fontSize: fontSize));
}

Future<img.Image> convertPDFtoImage(File pdf) async {
  // final pdfBytes = await pdf.save();
  // final pdfFile = File('example.pdf')..writeAsBytesSync(pdfBytes);
  final pdfImage = img.decodeImage(pdf.readAsBytesSync())!;
  final directory = await getDownloadsDirectory();

  final imagePath = '${directory!.path}/receipt_image.png';
  final imageFile = File(imagePath);
  await imageFile.writeAsBytes(img.encodePng(pdfImage));
  OpenFile.open(imagePath);
  return pdfImage;

}


