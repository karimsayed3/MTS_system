// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image/image.dart' as img;
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Image Conversion Example'),
//         ),
//         body: Center(
//           child: ConvertImage(),
//         ),
//       ),
//     );
//   }
// }
//
// class ConvertImage extends StatefulWidget {
//   @override
//   _ConvertImageState createState() => _ConvertImageState();
// }
//
// class _ConvertImageState extends State<ConvertImage> {
//   File? _pngFile;
//
//   Future<void> _convertImage() async {
//     // Replace 'input.png' with the path to your PNG image
//     File inputFile = File('vodafone-logo.png');
//
//     // Read the PNG image file
//     dynamic pngBytes = await inputFile.readAsBytes();
//
//     // Decode the PNG image
//     img.Image? pngImage = img.decodeImage(pngBytes);
//
//     if (pngImage != null) {
//       // Create a new image with white background
//       img.Image newImage = img.Image( height: 20,width: 20);
//       newImage.fill(img.getColor(255, 255, 255));
//
//       // Copy the PNG image onto the new image with white background
//       newImage.drawImage(pngImage, dstX: 0, dstY: 0);
//
//       // Replace 'output.png' with the desired output path and file name
//       File pngFile = File('output.png');
//
//       // Encode the new image as PNG and write to file
//       await pngFile.writeAsBytes(img.encodePng(newImage));
//
//       setState(() {
//         _pngFile = pngFile;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         ElevatedButton(
//           onPressed: _convertImage,
//           child: Text('Convert Image'),
//         ),
//         SizedBox(height: 20),
//         if (_pngFile != null) Image.file(_pngFile!),
//       ],
//     );
//   }
// }