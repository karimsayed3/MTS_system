import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:excel/excel.dart' as Excel;
import 'package:system/core/helpers/convert_string_to_date.dart';
import 'package:system/core/utils/utils.dart';
import 'package:system/features/late_customers_screen/data/models/get_late_subscribers_response.dart';
import 'package:system/features/subscribers_screen/data/models/get_subscribers_data_response.dart';

createExcelForLateSubscribers({required List<LateSubscriberData> data})async {
  final excel = Excel.Excel.createExcel();
  var sheet = excel['Sheet1'];
  sheet.isRTL = true;
  sheet.merge(
      Excel.CellIndex.indexByString('A1'), Excel.CellIndex.indexByString('H1'),
      customValue: const Excel.TextCellValue('كشف بأسماء المشتركين المتأخرين'));
  Excel.CellStyle cellStyle = Excel.CellStyle(
    horizontalAlign: Excel.HorizontalAlign.Center,
    bold: true,
    fontSize: 20,
  );
  var cell = sheet.cell(Excel.CellIndex.indexByString('A1'));
  cell.value = const Excel.TextCellValue('كشف بأسماء المشتركين المتأخرين');
  cell.cellStyle = cellStyle;

  Excel.CellStyle headerStyle = Excel.CellStyle(
    horizontalAlign: Excel.HorizontalAlign.Center,
    bold: true,
    fontSize: 14,
  );
  var header1 = sheet.cell(Excel.CellIndex.indexByString('A2'));
  header1.value = const Excel.TextCellValue("م");
  header1.cellStyle = headerStyle;

  var header54 = sheet.cell(Excel.CellIndex.indexByString('B2'));
  header54.value = const Excel.TextCellValue("اسم المشترك");
  header54.cellStyle = headerStyle;

  var header3 = sheet.cell(Excel.CellIndex.indexByString('C2'));
  header3.value = const Excel.TextCellValue("رقم الهاتف");
  header3.cellStyle = headerStyle;

  var header30 = sheet.cell(Excel.CellIndex.indexByString('D2'));
  header30.value =  const Excel.TextCellValue("التبعيه");
  header30.cellStyle = headerStyle;

  var header4 = sheet.cell(Excel.CellIndex.indexByString('E2'));
  header4.value = const Excel.TextCellValue("المحصل");
  header4.cellStyle = headerStyle;

  var header5 = sheet.cell(Excel.CellIndex.indexByString('F2'));
  header5.value = const Excel.TextCellValue("تاريخ التسجيل");
  header5.cellStyle = headerStyle;

  var header31 = sheet.cell(Excel.CellIndex.indexByString('G2'));
  header31.value = const Excel.TextCellValue("الباقة");
  header31.cellStyle = headerStyle;

  var header32 = sheet.cell(Excel.CellIndex.indexByString('H2'));
  header32.value =  const Excel.TextCellValue("الحساب");
  header32.cellStyle = headerStyle;


  // Add the data to the worksheet.
  int ll = 1;
  for (var item in data) {
    sheet.appendRow(
      [
        Excel.TextCellValue(ll.toString()),
        Excel.TextCellValue(item.name??"لا يوجد"),
        Excel.TextCellValue(item.phoneNo??"لا يوجد"),
        Excel.TextCellValue(item.relatedTo??"لا يوجد"),
        Excel.TextCellValue(item.collectorName??"لا يوجد"),
        Excel.TextCellValue(convertDateToString(item.registrationDate),),
        Excel.TextCellValue(item.planName??"لا يوجد"),
        Excel.TextCellValue(item.balance.toString()??"لا يوجد"),
      ],
    );
    ll++;
  }

  // Save the workbook to a file.
  var filename = path.join('my_data.xlsx');
  excel.save(fileName: filename);
  print(filename);
  final excelBytes = await excel.encode();
  // // Get the application documents directory
  // final appDocumentsDirectory = await getApplicationDocumentsDirectory();
  //
  // // Create a file in the documents directory
  // final file = File('${appDocumentsDirectory.path}/example.xlsx');

  // Write the Excel bytes to the file
  // await file.writeAsBytes(excelBytes!);

  downloadFile(excelBytes!);

  // Show a download prompt to the user
  // await _openFile(file.path);
  // excel.save(fileName: filename);
}