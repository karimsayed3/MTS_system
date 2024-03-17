import 'dart:io';
import 'dart:math';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

void downloadFile(List<int> bytes2) async {
  final directory = await getApplicationDocumentsDirectory();
  final filePath = '${directory.path}/${generateUniqueString()}.xlsx';
  await File(filePath).writeAsBytes(bytes2);
  _openFile(filePath);
}
Future<void> _openFile(String filePath) async {
  final file = File(filePath);

  if (await file.exists()) {
    // Open the file using the platform's default app
    await OpenFile.open(filePath,
        type:
        'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
  } else {
    // Handle file not found
    print('File not found: $filePath');
  }
}
String generateUniqueString() {
  // Use part of the current timestamp
  String timestampPart = DateTime.now().microsecondsSinceEpoch.toString().substring(6);

  // Generate a random component
  String randomPart = Random().nextInt(999999).toString().padLeft(6, '0');

  // Combine the timestamp and random parts
  String uniqueString = timestampPart + randomPart;

  return uniqueString;
}