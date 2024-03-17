import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:excel/excel.dart' as Excel;
import 'package:system/core/helpers/convert_string_to_date.dart';
import 'package:system/core/utils/utils.dart';
import 'package:system/features/resellers_requests_screen/data/models/get_collector_requests_response.dart';

createExcelForCollectorsRequests({required List<RequestData> data})async {
  final excel = Excel.Excel.createExcel();
  var sheet = excel['Sheet1'];
  sheet.isRTL = true;
  sheet.merge(
      Excel.CellIndex.indexByString('A1'), Excel.CellIndex.indexByString('J1'),
      customValue: Excel.TextCellValue('كشف بطلبات المحصلون'));
  Excel.CellStyle cellStyle = Excel.CellStyle(
    horizontalAlign: Excel.HorizontalAlign.Center,
    bold: true,
    fontSize: 20,
  );
  var cell = sheet.cell(Excel.CellIndex.indexByString('A1'));
  cell.value = Excel.TextCellValue('كشف بطلبات المحصلون');
  cell.cellStyle = cellStyle;

  Excel.CellStyle headerStyle = Excel.CellStyle(
    horizontalAlign: Excel.HorizontalAlign.Center,
    bold: true,
    fontSize: 14,
  );
  var header1 = sheet.cell(Excel.CellIndex.indexByString('A2'));
  header1.value = Excel.TextCellValue("م");
  header1.cellStyle = headerStyle;

  var header54 = sheet.cell(Excel.CellIndex.indexByString('B2'));
  header54.value = Excel.TextCellValue("الاسم");
  header54.cellStyle = headerStyle;

  var header3 = sheet.cell(Excel.CellIndex.indexByString('C2'));
  header3.value = Excel.TextCellValue("رقم الهاتف");
  header3.cellStyle = headerStyle;

  var header30 = sheet.cell(Excel.CellIndex.indexByString('D2'));
  header30.value =  Excel.TextCellValue("تاريخ الطلب");
  header30.cellStyle = headerStyle;

  var header4 = sheet.cell(Excel.CellIndex.indexByString('E2'));
  header4.value = Excel.TextCellValue("التبعيه");
  header4.cellStyle = headerStyle;

  var header5 = sheet.cell(Excel.CellIndex.indexByString('F2'));
  header5.value = Excel.TextCellValue("الحساب");
  header5.cellStyle = headerStyle;

  var header31 = sheet.cell(Excel.CellIndex.indexByString('G2'));
  header31.value = const Excel.TextCellValue("القيمة القديمة");
  header31.cellStyle = headerStyle;

  var header32 = sheet.cell(Excel.CellIndex.indexByString('H2'));
  header32.value = const Excel.TextCellValue("القيمة الجديدة");
  header32.cellStyle = headerStyle;

  var header9 = sheet.cell(Excel.CellIndex.indexByString('I2'));
  header9.value = const Excel.TextCellValue("نوع الطلب");
  header9.cellStyle = headerStyle;


  var header10 = sheet.cell(Excel.CellIndex.indexByString('J2'));
  header10.value = const Excel.TextCellValue("تاريخ التنفيذ");
  header10.cellStyle = headerStyle;

  // Add the data to the worksheet.
  int ll = 1;
  for (var item in data) {
    sheet.appendRow(
      [
        Excel.TextCellValue(ll.toString()),
        Excel.TextCellValue(item.name??"لا يوجد"),
        Excel.TextCellValue(item.phoneNo??"لا يوجد"),
        Excel.TextCellValue(convertDateToString(item.requestDate),),
        Excel.TextCellValue(item.relatedTo??"لا يوجد"),
        Excel.TextCellValue(item.balance.toString()??"لا يوجد"),
        Excel.TextCellValue(item.oldValue??"لا يوجد"),
        Excel.TextCellValue(item.newValue??"لا يوجد"),
        Excel.TextCellValue(item.requestType??"لا يوجد"),
        Excel.TextCellValue(convertDateToString(item.actionDate),),
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