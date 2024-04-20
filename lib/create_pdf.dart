import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:system/print_page.dart';
import 'core/helpers/check_platform.dart';
import 'core/routing/routers.dart';
import 'core/widgets/custom_navigation_bar_widget.dart';

Future<File> createPdfReceipt({
  required BuildContext context,
}) async {
  final doc = pw.Document();
  PdfPageFormat customReceiptFormat = const PdfPageFormat(72 * PdfPageFormat.mm,125 * PdfPageFormat.mm,marginRight: 5.0 ,marginLeft: 5.0); // Adjust width and height as needed
  final img = await rootBundle.load('assets/images/logo-mk.png');
  final imageBytes = img.buffer.asUint8List();
  pw.Image logo = pw.Image(pw.MemoryImage(imageBytes));
  var data = await rootBundle.load("assets/fonts/din.ttf");
  var myFont = pw.Font.ttf(data);
  // Header section with logo and company info
  doc.addPage(
      pw.Page(
      pageFormat: customReceiptFormat,
      textDirection: pw.TextDirection.rtl,
      build: (context) {
        return pw.Container(
          color: PdfColor.fromHex('#FFFFFF'),
          child:pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                alignment: pw.Alignment.center,
                height: 30,
                child: logo,
              ),
              pw.Divider(thickness: 1, height: 1),
              pw.Container(
                color: PdfColor.fromHex('#1E90FF'),
                padding: const pw.EdgeInsets.only(bottom: 5),
                child: pw.Center(
                  child: defaultTextInPW(
                      title: 'ايصال سداد فاتورة', myFont: myFont, fontSize: 16, color: PdfColors.white),
                ),
              ),
              // pw.Text('ايصال سداد فاتورة', style: pw.TextStyle(font: myFont)),
              pw.Table(
                border: pw.TableBorder.all(width: .5),
                columnWidths: {
                  0: const pw.FlexColumnWidth(2),
                  1: const pw.FlexColumnWidth(3),
                },
                children: [
                  // pw.TableRow(
                  //   children: [
                  //     pw.Center(
                  //       child: pw.Text('', style: pw.TextStyle(font: myFont)),
                  //     ),
                  //     tableRowItem(
                  //       title: 'رقم الفاتورة',
                  //       myFont: myFont,
                  //     ),
                  //   ],
                  // ),
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
                            style: pw.TextStyle(font: myFont,fontSize: 8)),
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
                            '01156788394', style: pw.TextStyle(font: myFont,fontSize: 8)),
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
                        child: pw.Text('', style: pw.TextStyle(font: myFont,fontSize: 8)),
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
                        pw.Text('100', style: pw.TextStyle(font: myFont,fontSize: 8)),
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
                        child: pw.Text('', style: pw.TextStyle(font: myFont,fontSize: 8)),
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
                      pw.Text('', style: pw.TextStyle(font: myFont,fontSize: 8)),
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
                      pw.Text('', style: pw.TextStyle(font: myFont,fontSize: 8)),
                      tableRowItem(
                        title: 'نوع التحصيل',
                        myFont: myFont,
                      ),

                      // pw.Text('نوع التحصيل', style: pw.TextStyle(font: myFont)),
                    ],
                  ),
                  // pw.TableRow(
                  //   children: [
                  //     pw.Text('', style: pw.TextStyle(font: myFont)),
                  //     tableRowItem(
                  //       title: 'المستلم',
                  //       myFont: myFont,
                  //     ),
                  //
                  //     // pw.Text('المستلم', style: pw.TextStyle(font: myFont)),
                  //   ],
                  // ),
                  // Add more table rows for each order item
                ],
              ),
              // defaultTextInPW(title: 'عزيزى العميل برجاء الالتزام بالاتى:', myFont: myFont,fontSize: 12),
              pw.Text(
                'عزيزى العميل برجاء الالتزام بالاتى:',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 10,
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
                myFont: myFont,fontSize: 8
              ),
              defaultTextInPW(
                title:
                '- دفع الفاتورة مقدما فور التجديد عن الشهر لتجنب وقف الخدمة من جانب الشركة',
                myFont: myFont,fontSize: 8
              ),
              defaultTextInPW(
                title: '- تجديد الفاتورة ثابت شهريا يوم 11 من كل شهر ',
                myFont: myFont,fontSize: 8
              ),
              defaultTextInPW(
                title:
                '- لتعديل الباقة / التحويل لنظام الكارت رجاءاً الإبلاغ قبل التجديد ب 10 ايام على الاقل',
                myFont: myFont,fontSize: 8
              ),
              pw.Divider(
                  thickness: 1, height: 1, color: PdfColor.fromHex('#CDCDB4')),
              pw.Center(
                child: defaultTextInPW(
                    title:
                    'نسعد بخدمتكم دائما',
                    myFont: myFont,
                    fontSize: 12
                ),
              ),
              pw.Divider(
                  thickness: 1, height: 1, color: PdfColor.fromHex('#CDCDB4')),
              pw.Table(
                  border: pw.TableBorder.all(
                    width: 0.5,),
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
          )
        );
      })
  );

  // final byteData = await doc.save();
  const fileName = 'receipt.pdf';
  final directory = await getDownloadsDirectory();
  final filePath = '${directory!.path}/$fileName';

  // // Write PDF data to the file
  // await File(filePath).writeAsBytes(byteData.buffer.asUint8List());
  await File(filePath).writeAsBytes(await doc.save());
  
 // isMobile()?  null : await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());

  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());
 // isMobile() ? _convertPdfToImages(doc) : null;
  // Convert the PDF to images
  File imageFile = await convertPdfToImages(doc);

  // Initialize the image
  // File imgFile = await initImage();
  // String imagePath = '';
  // Use the generated image paths
  // for (imagePath in imagePaths) {
  //   print(imagePath); // Prints the path of the generated image
  //   // Pass the image path to the _initImg function or use it as needed
  // }
  // Navigator.push(context, MaterialPageRoute(builder: (context) => PrintersView(imgPath: imagePath) ));
  return imageFile;
  // Navigator.push(context, MaterialPageRoute(builder: (context) => PrintersView(imgPath: imageFile)));
  // final filePath = await writeBytes(byteData, fileName);
  // Open the PDF document
  // OpenFile.open(filePath);
  // await  convertPDFtoImage(File(filePath));
}

Future<File> createPdfReceiptForMobile({
  required BuildContext context,
}) async {
  final doc = pw.Document();
  PdfPageFormat customReceiptFormat = const PdfPageFormat(270 * PdfPageFormat.mm,330 * PdfPageFormat.mm,marginRight: 3.0 ,marginLeft: 3.0); // Adjust width and height as needed
  final img = await rootBundle.load('assets/images/logo-mk.png');
  final imageBytes = img.buffer.asUint8List();
  pw.Image logo = pw.Image(pw.MemoryImage(imageBytes));
  var data = await rootBundle.load("assets/fonts/din.ttf");
  var myFont = pw.Font.ttf(data);
  // Header section with logo and company info
  doc.addPage(
      pw.Page(
          pageFormat: customReceiptFormat,
          textDirection: pw.TextDirection.rtl,
          build: (context) {
            return pw.Container(
                color: PdfColor.fromHex('#FFFFFF'),
                child:pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Container(
                      alignment: pw.Alignment.center,
                      height: 100,
                      child: logo,
                    ),
                    pw.Divider(thickness: 1, height: 1),
                    pw.Container(
                      color: PdfColor.fromHex('#1E90FF'),
                      padding: const pw.EdgeInsets.only(bottom: 5),
                      child: pw.Center(
                        child: defaultTextInPW(
                            title: 'ايصال سداد فاتورة', myFont: myFont, fontSize: 30, color: PdfColors.white),
                      ),
                    ),
                    // pw.Text('ايصال سداد فاتورة', style: pw.TextStyle(font: myFont)),
                    pw.Table(
                      border: pw.TableBorder.all(width: 1),
                      columnWidths: {
                        0: const pw.FlexColumnWidth(1),
                        1: const pw.FlexColumnWidth(1),
                      },
                      children: [
                        // pw.TableRow(
                        //   children: [
                        //     pw.Center(
                        //       child: pw.Text('', style: pw.TextStyle(font: myFont)),
                        //     ),
                        //     tableRowItem(
                        //       title: 'رقم الفاتورة',
                        //       myFont: myFont,
                        //     ),
                        //   ],
                        // ),
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
                                  style: pw.TextStyle(font: myFont,fontSize: 24)),
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
                                  '01156788394', style: pw.TextStyle(font: myFont,fontSize: 24)),
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
                              child: pw.Text('', style: pw.TextStyle(font: myFont,fontSize: 24)),
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
                              pw.Text('100', style: pw.TextStyle(font: myFont,fontSize: 24)),
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
                              child: pw.Text('', style: pw.TextStyle(font: myFont,fontSize: 24)),
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
                            pw.Text('', style: pw.TextStyle(font: myFont,fontSize: 24)),
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
                            pw.Text('', style: pw.TextStyle(font: myFont,fontSize: 24)),
                            tableRowItem(
                              title: 'نوع التحصيل',
                              myFont: myFont,
                            ),

                            // pw.Text('نوع التحصيل', style: pw.TextStyle(font: myFont)),
                          ],
                        ),
                        // pw.TableRow(
                        //   children: [
                        //     pw.Text('', style: pw.TextStyle(font: myFont)),
                        //     tableRowItem(
                        //       title: 'المستلم',
                        //       myFont: myFont,
                        //     ),
                        //
                        //     // pw.Text('المستلم', style: pw.TextStyle(font: myFont)),
                        //   ],
                        // ),
                        // Add more table rows for each order item
                      ],
                    ),
                    // defaultTextInPW(title: 'عزيزى العميل برجاء الالتزام بالاتى:', myFont: myFont,fontSize: 12),
                    pw.Text(
                      'عزيزى العميل برجاء الالتزام بالاتى:',
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 30,
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
                        fontSize: 28
                    ),
                    defaultTextInPW(
                      title:
                      '- دفع الفاتورة مقدما فور التجديد عن الشهر لتجنب وقف الخدمة من جانب الشركة',
                      myFont: myFont,fontSize: 28
                    ),
                    defaultTextInPW(
                      title: '- تجديد الفاتورة ثابت شهريا يوم 11 من كل شهر ',
                      myFont: myFont,fontSize: 28
                    ),
                    defaultTextInPW(
                      title:
                      '- لتعديل الباقة / التحويل لنظام الكارت رجاءاً الإبلاغ قبل التجديد ب 10 ايام على الاقل',
                      myFont: myFont,
                        fontSize: 28
                    ),
                    pw.Divider(
                        thickness: 1, height: 1, color: PdfColor.fromHex('#CDCDB4')),
                    pw.Center(
                      child: defaultTextInPW(
                          title:
                          'نسعد بخدمتكم دائما',
                          myFont: myFont,
                          fontSize: 30
                      ),
                    ),
                    pw.Divider(
                        thickness: 1, height: 1, color: PdfColor.fromHex('#CDCDB4')),
                    pw.Table(
                        border: pw.TableBorder.all(
                          width: 0.5,),
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
                                      fontSize: 24
                                  ),
                                )
                                ,
                                pw.Container(
                                  padding: const pw.EdgeInsets.all(5),
                                  child: defaultTextInPW(
                                      title:
                                      'للتواصل واتس - فون رقم 064733347',
                                      myFont: myFont,
                                      fontSize: 24
                                  ),
                                )
                              ]
                          )
                        ]
                    ),

                  ],
                )
            );
          })
  );

  // final byteData = await doc.save();
  const fileName = 'receipt.pdf';
  final directory = await getDownloadsDirectory();
  final filePath = '${directory!.path}/$fileName';

  // // Write PDF data to the file
  // await File(filePath).writeAsBytes(byteData.buffer.asUint8List());
  await File(filePath).writeAsBytes(await doc.save());

  // isMobile()?  null : await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());

  // await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());
  // isMobile() ? _convertPdfToImages(doc) : null;
  // Convert the PDF to images
  File imageFile = await convertPdfToImages(doc);

  // Initialize the image
  // File imgFile = await initImage();
  // String imagePath = '';
  // Use the generated image paths
  // for (imagePath in imagePaths) {
  //   print(imagePath); // Prints the path of the generated image
  //   // Pass the image path to the _initImg function or use it as needed
  // }
  // Navigator.push(context, MaterialPageRoute(builder: (context) => PrintersView(imgPath: imagePath) ));
  return imageFile;
  // Navigator.push(context, MaterialPageRoute(builder: (context) => PrintersView(imgPath: imageFile)));
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
      child: pw.Text(title, style: pw.TextStyle(font: myFont,fontSize:isMobile()? 24 : 8)),
    ),
  );
}

defaultTextInPW({
  dynamic myFont,
  required String title,
 dynamic color = PdfColors.black,
  double fontSize = 10,
}) {
  return pw.Text(title, style: pw.TextStyle(font: myFont, fontSize: fontSize,color: color));
}

// Future<img.Image> convertPDFtoImage(File pdf) async {
//   // final pdfBytes = await pdf.save();
//   // final pdfFile = File('example.pdf')..writeAsBytesSync(pdfBytes);
//   final pdfImage = img.decodeImage(pdf.readAsBytesSync())!;
//   final directory = await getDownloadsDirectory();
//
//   final imagePath = '${directory!.path}/receipt_image.png';
//   final imageFile = File(imagePath);
//   await imageFile.writeAsBytes(img.encodePng(pdfImage));
//   OpenFile.open(imagePath);
//   return pdfImage;
//
// }
// Convert a Pdf to images, one image per page, get only pages 1 and 2 at 72 dpi
Future<File> convertPdfToImages(pw.Document doc) async {
  List<String> imagePaths = [];
  int pageNumber = 0;
  File file  = File("");
  await for (var page in Printing.raster(await doc.save(), pages: [0], dpi: 72)) {
    final image = await page.toPng(); // Convert the page to PNG image
    // final Uint8List jpgData = convertPngToJpg(image);
    file = await saveImageToTempDirectory(image, pageNumber);
    // imagePaths.add(path);
    pageNumber++;
  }
  return file;
}
// Uint8List convertPngToJpg(Uint8List pngData) {
//   img.Image image = img.decodeImage(pngData)!; // Decode PNG image
//   return Uint8List.fromList(img.encodeJpg(image)); // Encode as JPG
// }
// Save the image to temporary directory and return the file path
Future<File> saveImageToTempDirectory(Uint8List imageData, int pageNumber) async {
  String path = (await getTemporaryDirectory()).path;
  File imgFile = File("$path/page$pageNumber.png");
  await imgFile.writeAsBytes(imageData);
  return imgFile;
}

// Load an image from assets and save it to a temporary file
Future<File> initImage() async {
  try {
    ByteData byteData = await rootBundle.load("assets/images/login_picture.png");
    Uint8List buffer = byteData.buffer.asUint8List();
    String path = (await getTemporaryDirectory()).path;
    File imgFile = File("$path/img.png");
    await imgFile.writeAsBytes(buffer);
    return imgFile;
  } catch (e) {
    rethrow;
  }
}


/// Convert a Pdf to images, one image per page, get only pages 1 and 2 at 72 dpi
void _convertPdfToImages(pw.Document doc) async {
  await for (var page in Printing.raster(await doc.save(), pages: [0, 1], dpi: 72)) {
    final image = page.toImage(); // ...or page.toPng()
    print(image);
  }
}