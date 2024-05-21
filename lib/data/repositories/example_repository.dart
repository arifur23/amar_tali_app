// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:permission_handler/permission_handler.dart';
// import 'package:device_info_plus/device_info_plus.dart';
//
// class Product {
//   final String name;
//   final double price;
//   final double vatInPercent;
//   int amount = 0;
//
//   Product(this.name, this.price, this.vatInPercent);
// }
//
// class CustomRow {
//   final String itemName;
//   final String itemPrice;
//   final String amount;
//   final String total;
//   final String vat;
//
//   CustomRow(this.itemName, this.itemPrice, this.amount, this.total, this.vat);
// }
//
// class ExampleRepository {
//   Future<Uint8List> createHelloWorld() {
//     final pdf = pw.Document();
//     pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         build: (pw.Context context) {
//           return pw.Center(
//             child: pw.Text("Hello World"),
//           );
//         },
//       ),
//     );
//
//     return pdf.save();
//   }
//
//   Future<bool> requestPermission(Permission permission)async{
//     AndroidDeviceInfo  androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
//     if(androidDeviceInfo.version.sdkInt >= 30){
//       var req = await Permission.manageExternalStorage.request();
//       if(req.isGranted){
//         return true;
//       }else{
//         return false;
//       }
//     }else{
//       if(await permission.isGranted){
//         return true;
//       }else{
//         var request = await permission.request();
//         if(request.isGranted){
//           return true;
//         }else{
//           return false;
//         }
//       }
//     }
//   }
//
//   Future<Uint8List> createInvoice(List<Product> soldProducts) async {
//     final pdf = pw.Document();
//
//     final List<CustomRow> elements = [
//       CustomRow("Item Name", "Item Price", "Amount", "Total", "Vat"),
//       for (var product in soldProducts)
//         CustomRow(
//           product.name,
//           product.price.toStringAsFixed(2),
//           product.amount.toStringAsFixed(2),
//           (product.price * product.amount).toStringAsFixed(2),
//           (product.vatInPercent * product.price).toStringAsFixed(2),
//         ),
//       CustomRow(
//         "Sub Total",
//         "",
//         "",
//         "",
//         "${getSubTotal(soldProducts)} EUR",
//       ),
//       CustomRow(
//         "Vat Total",
//         "",
//         "",
//         "",
//         "${getVatTotal(soldProducts)} EUR",
//       ),
//       CustomRow(
//         "Vat Total",
//         "",
//         "",
//         "",
//         "${(double.parse(getSubTotal(soldProducts)) + double.parse(getVatTotal(soldProducts))).toStringAsFixed(2)} EUR",
//       )
//     ];
//     final image = (await rootBundle.load("assets/flutter_explained_logo.jpg"))
//         .buffer
//         .asUint8List();
//     pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         build: (pw.Context context) {
//           return pw.Column(
//             children: [
//               pw.Image(pw.MemoryImage(image),
//                   width: 150, height: 150, fit: pw.BoxFit.cover),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Column(
//                     children: [
//                       pw.Text("Customer Name"),
//                       pw.Text("Customer Address"),
//                       pw.Text("Customer City"),
//                     ],
//                   ),
//                   pw.Column(
//                     children: [
//                       pw.Text("Max Weber"),
//                       pw.Text("Weird Street Name 1"),
//                       pw.Text("77662 Not my City"),
//                       pw.Text("Vat-id: 123456"),
//                       pw.Text("Invoice-Nr: 00001")
//                     ],
//                   )
//                 ],
//               ),
//               pw.SizedBox(height: 50),
//               pw.Text(
//                   "Dear Customer, thanks for buying at Flutter Explained, feel free to see the list of items below."),
//               pw.SizedBox(height: 25),
//               itemColumn(elements),
//               pw.SizedBox(height: 25),
//               pw.Text("Thanks for your trust, and till the next time."),
//               pw.SizedBox(height: 25),
//               pw.Text("Kind regards,"),
//               pw.SizedBox(height: 25),
//               pw.Text("Max Weber")
//             ],
//           );
//         },
//       ),
//     );
//     return pdf.save();
//   }
//
//   pw.Expanded itemColumn(List<CustomRow> elements) {
//     return pw.Expanded(
//       child: pw.Column(
//         children: [
//           for (var element in elements)
//             pw.Row(
//               children: [
//                 pw.Expanded(
//                     child: pw.Text(element.itemName,
//                         textAlign: pw.TextAlign.left)),
//                 pw.Expanded(
//                     child: pw.Text(element.itemPrice,
//                         textAlign: pw.TextAlign.right)),
//                 pw.Expanded(
//                     child:
//                     pw.Text(element.amount, textAlign: pw.TextAlign.right)),
//                 pw.Expanded(
//                     child:
//                     pw.Text(element.total, textAlign: pw.TextAlign.right)),
//                 pw.Expanded(
//                     child: pw.Text(element.vat, textAlign: pw.TextAlign.right)),
//               ],
//             )
//         ],
//       ),
//     );
//   }
//
//   Future<void> savePdfFile(String fileName, Uint8List byteList) async {
//
//     try {
//       // final output = await getDownloadsDirectory();
//       Directory? tempDir = await DownloadsPath.downloadsDirectory();
//       var filePath = "${tempDir!.path}/$fileName.pdf";
//       final file = File(filePath);
//       print('$filePath file path');
//       print('$fileName file name');
//       await file.writeAsBytes(byteList);
//       print('${file}file');
//       // await OpenDocument.openDocument(filePath: filePath);
//       if(await requestPermission(Permission.storage)){
//         await OpenFile.open(filePath).then((value){
//           print(value.message.toString());
//         });
//         print('Permission Accepted');
//       }else{
//         print('Permission Denied');
//       }
//     } catch (e) {
//       debugPrint("ERROR: $e");
//     }
//   }
//
//   String getSubTotal(List<Product> products) {
//     return products
//         .fold(0.0,
//             (double prev, element) => prev + (element.amount * element.price))
//         .toStringAsFixed(2);
//   }
//
//   String getVatTotal(List<Product> products) {
//     return products
//         .fold(
//       0.0,
//           (double prev, next) =>
//       prev + ((next.price / 100 * next.vatInPercent) * next.amount),
//     )
//         .toStringAsFixed(2);
//   }
// }