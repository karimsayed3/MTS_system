// import 'package:bluetooth_print/bluetooth_print.dart';
// import 'package:bluetooth_print/bluetooth_print_model.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class PrintPage extends StatefulWidget {
//   final List<Map<String, dynamic>> data;
//   const PrintPage(this.data, {super.key});
//
//   @override
//   _PrintPageState createState() => _PrintPageState();
// }
//
// class _PrintPageState extends State<PrintPage> {
//   BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
//   List<BluetoothDevice> _devices = [];
//   String _devicesMsg = "";
//   final f = NumberFormat("\$###,###.00", "en_US");
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) => {initPrinter()});
//   }
//
//   Future<void> initPrinter() async {
//     bluetoothPrint.startScan(timeout: const Duration(seconds: 2));
//
//     if (!mounted) return;
//     bluetoothPrint.scanResults.listen(
//       (val) {
//         if (!mounted) return;
//         setState(() => {_devices = val});
//         if (_devices.isEmpty) {
//           setState(() {
//             _devicesMsg = "No Devices";
//           });
//         }
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Select Printer'),
//         backgroundColor: Colors.redAccent,
//       ),
//       body: _devices.isEmpty
//           ? Center(
//               child: Text(_devicesMsg ?? ''),
//             )
//           : ListView.builder(
//               itemCount: _devices.length,
//               itemBuilder: (c, i) {
//                 return ListTile(
//                   leading: const Icon(Icons.print),
//                   title: Text(_devices[i].name!),
//                   subtitle: Text(_devices[i].address!),
//                   onTap: () {
//                     _startPrint(_devices[i]);
//                   },
//                 );
//               },
//             ),
//     );
//   }
//
//   Future<void> _startPrint(BluetoothDevice device) async {
//     if (device != null && device.address != null) {
//       await bluetoothPrint.connect(device);
//
//       Map<String, dynamic> config = Map();
//       List<LineText> list = [];
//
//       list.add(
//         LineText(
//           type: LineText.TYPE_TEXT,
//           content: "Grocery App",
//           weight: 2,
//           width: 2,
//           height: 2,
//           align: LineText.ALIGN_CENTER,
//           linefeed: 1,
//         ),
//       );
//
//       for (var i = 0; i < widget.data.length; i++) {
//         list.add(
//           LineText(
//             type: LineText.TYPE_TEXT,
//             content: widget.data[i]['title'],
//             weight: 0,
//             align: LineText.ALIGN_LEFT,
//             linefeed: 1,
//           ),
//         );
//
//         list.add(
//           LineText(
//             type: LineText.TYPE_TEXT,
//             content:
//                 "${f.format(this.widget.data[i]['price'])} x ${this.widget.data[i]['qty']}",
//             align: LineText.ALIGN_LEFT,
//             linefeed: 1,
//           ),
//         );
//       }
//       await bluetoothPrint.printReceipt(config, list);
//
//     }
//   }
// }

/// ccccccccccccccccccccccccccccc
// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_scan_bluetooth/flutter_scan_bluetooth.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:system/printer_manager.dart';
//
// class PrintersView extends StatefulWidget {
//   const PrintersView({Key? key, required this.imgPath}) : super(key: key);
//
//   final File imgPath;
//
//   @override
//   State<PrintersView> createState() => _PrintersViewState();
// }
//
// class _PrintersViewState extends State<PrintersView> {
//   late FlutterScanBluetooth _scanBluetooth;
//   late List<BluetoothDevice> _devices;
//   BluetoothDevice? _selectedDevice;
//   // FlutterBlue flutterBlue = FlutterBlue.instance;
//   // BlueThermalPrinter bluetoothPrinter = BlueThermalPrinter.instance;
//
//   late File imgFile;
//   bool isScanning = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _devices = [];
//     _scanBluetooth = FlutterScanBluetooth();
//     _startScan();
//     imgFile = widget.imgPath;
//     // _initImg(widget.imgPath);
//   }
//
//   _startScan() async {
//     setState(() {
//       isScanning = true;
//     });
//     await _scanBluetooth.startScan();
//
//     _scanBluetooth.devices.listen((dev) {
//       if(! _isDeviceAdded(dev)){
//         setState(() {
//           _devices.add(dev);
//         });
//       }
//     });
//
//     await Future.delayed(const Duration(seconds: 10));
//     _stopScan();
//   }
//
//   _stopScan() {
//     _scanBluetooth.stopScan();
//     setState(() {
//       isScanning = false;
//     });
//   }
//
//   bool _isDeviceAdded(BluetoothDevice device) => _devices.contains(device);
//
//
//   // _initImg(File imageFile) async {
//   //   try {
//   //     // ByteData byteData = await rootBundle.load(imgPath);
//   //     // Uint8List buffer = byteData.buffer.asUint8List();
//   //     // String path = (await getTemporaryDirectory()).path;
//   //     imageFile = File("$path/img.png");
//   //     imgFile.writeAsBytes(imageFile);
//   //   } catch (e) {
//   //     rethrow;
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         toolbarHeight: 0.0,
//       ),
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 15,
//           ),
//           ConditionalBuilder(
//             condition: !isScanning,
//             builder: (context) => FloatingActionButton(
//               onPressed: () {
//                 _startScan();
//               },
//               child: const Icon(
//                 Icons.bluetooth_audio,
//               ),
//             ),
//             fallback: (context) => const CircularProgressIndicator(
//               color: Colors.lightBlue,
//             ),
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           ConditionalBuilder(
//               condition: _selectedDevice != null,
//               builder: (context) => Column(
//                 children: [
//                   _buildDev(_selectedDevice!),
//                   const SizedBox(height: 15),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       MaterialButton(
//                         onPressed: () {
//                           PrinterManager.printImg(imgFile.path);
//                         }, color: Colors.lightBlue,
//                         child: const Text(
//                           "Print",
//                           style: TextStyle(color: Colors.white),),
//                       ),
//                       MaterialButton(
//                         onPressed: () {
//                           PrinterManager.connect(_selectedDevice!.address);
//                         }, color: Colors.lightBlue,
//                         child: const Text(
//                           "Connect",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               fallback: (context) => Container(
//                 child: const Text("لم يتم تحديد طابعة"),
//               )),
//           const SizedBox(
//             height: 15,
//           ),
//           Container(
//             height: 1,
//             width: double.infinity,
//             color: Colors.lightBlue,
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   ..._devices.map(
//                         (dev) => _buildDev(dev),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   Future<void> printPdf() async {
//     // Load the PDF file as bytes
//     File pdfFile = File('path_to_your_pdf_file.pdf');
//     List<int> bytes = await pdfFile.readAsBytes();
//
//     // Send the bytes to the printer
//     // await bluetoothPrinter.printBytes(bytes);
//   }
//   Widget _buildDev(BluetoothDevice dev) => GestureDetector(
//     onTap: () {
//       setState(() {
//         _selectedDevice = dev;
//       });
//     },
//     child: Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(10),
//       margin: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: Colors.grey.withOpacity(0.125),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         children: [
//           Text(dev.name,
//               style: const TextStyle(
//                   color: Colors.lightBlue,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold)),
//           const SizedBox(
//             height: 10,
//           ),
//           Text(dev.address,
//               style: const TextStyle(color: Colors.grey, fontSize: 14))
//         ],
//       ),
//     ),
//   );
// }