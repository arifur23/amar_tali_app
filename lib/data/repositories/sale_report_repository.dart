import 'dart:io';
import 'package:amar_tali_app/data/firebase/clients/sale_client.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_sale_mapper.dart';
import 'package:amar_tali_app/data/repositories/sale_repository.dart';
import 'package:amar_tali_app/domain/models/sale_model/sale.dart';
import 'package:amar_tali_app/domain/models/sale_report_model/sale_report.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:logger/logger.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

class Product {
  final String name;
  final double price;
  final double vatInPercent;
  int amount = 0;

  Product(this.name, this.price, this.vatInPercent);
}

class CustomRowSale {
  final String date;
  final String details;
  final int sellingPrice;
  final int buyingPrice;
  final int profit;

  CustomRowSale({required this.date, required this.details, required this.sellingPrice, required this.buyingPrice, required this.profit});

}


class SaleReportRepository{

  static Logger log = Logger();
  static SaleClient saleClient = SaleClient();
  static NetSaleMapper netSaleMapper = NetSaleMapper(log: log);

  // SaleReportRepository({required SaleRepository saleRepository});
  SaleReportRepository();


  final SaleRepository saleRepository = SaleRepository(saleClient: saleClient, netSellMapper: netSaleMapper);

  Future<SaleReport> generateSaleReportData() async{

    List<Sale> totalSales = await saleRepository.getAllSales();

    return SaleReport(date: 'date', totalSales: totalSales, profit: getProfitFromSales(totalSales), lastDaysFor: 0);
  }

  int getProfitFromSales(List<Sale> totalSales){
    int profit = 0;
    try{
      for(var sale in totalSales){
        profit = profit + (sale.sellingPrice - sale.buyingPrice);
      }
    }catch(e){
      print(e.toString());
    }
    return profit;
  }

  Future<Uint8List> createHelloWorld() {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("Hello World"),
          );
        },
      ),
    );

    return pdf.save();
  }

  Future<bool> requestPermission(Permission permission)async{
    AndroidDeviceInfo  androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
    if(androidDeviceInfo.version.sdkInt >= 30){
      var req = await Permission.manageExternalStorage.request();
      if(req.isGranted){
        return true;
      }else{
        return false;
      }
    }else{
      if(await permission.isGranted){
        return true;
      }else{
        var request = await permission.request();
        if(request.isGranted){
          return true;
        }else{
          return false;
        }
      }
    }
  }

  Future<Uint8List> createInvoice(SaleReport saleReport,) async {
    final pdf = pw.Document();

    int totalSellingP = 0;
    int totalBuyingP = 0;

    for(var sale in saleReport.totalSales){
      totalSellingP = totalSellingP + sale.sellingPrice;
    }
    for(var sale in saleReport.totalSales){
      totalBuyingP = totalBuyingP + sale.buyingPrice;
    }

    final List<CustomRowSale> elements = [
      for (var sale in saleReport.totalSales)
        CustomRowSale(
          date: sale.date,
          details: sale.details,
          sellingPrice: sale.sellingPrice,
          buyingPrice: sale.buyingPrice,
          profit: (sale.sellingPrice - sale.buyingPrice)
        ),
    ];
    final image = (await rootBundle.load("assets/glitzbd.png"))
        .buffer
        .asUint8List();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Image(pw.MemoryImage(image),
                  width: 150, height: 150, fit: pw.BoxFit.cover),
              pw.SizedBox(height: 20),
              pw.Text(
                  "Dear Admin, thanks for Using our App, feel free to see the list of Sales Report below."),
              pw.SizedBox(height: 10),
              pw.Expanded(
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                        child: pw.Text('Date',
                            textAlign: pw.TextAlign.left),
                      ),
                      pw.Expanded(
                        child: pw.Text('Details',
                            textAlign: pw.TextAlign.right),
                      ),
                      pw.Expanded(
                        child: pw.Text('Selling Price',
                            textAlign: pw.TextAlign.right),
                      ),
                      pw.Expanded(
                        child: pw.Text('Buying Price',
                            textAlign: pw.TextAlign.right),
                      ),
                      pw.Expanded(
                        child: pw.Text('Profit',
                            textAlign: pw.TextAlign.right),
                      )
                    ]
                  )
              ),
              itemColumn(elements),
              pw.Divider(),
              pw.Expanded(
                  child: pw.Row(
                      children: [
                        pw.Expanded(
                          child: pw.Text('Total',
                              textAlign: pw.TextAlign.left),
                        ),
                        pw.Expanded(
                          child: pw.Text('        '),
                        ),
                        pw.Expanded(
                          child: pw.Text(totalSellingP.toString(),
                              textAlign: pw.TextAlign.right),
                        ),
                        pw.Expanded(
                          child: pw.Text(totalBuyingP.toString(),
                              textAlign: pw.TextAlign.right),
                        ),
                        pw.Expanded(
                          child: pw.Text(saleReport.profit.toString(),
                              textAlign: pw.TextAlign.right),
                        )
                      ]
                  )
              ),
              pw.SizedBox(height: 25),
              pw.Text("Thanks for your trust, and till the next time."),
              pw.SizedBox(height: 25),
              pw.Text("Kind regards,"),
              pw.SizedBox(height: 25),
              pw.Text("MD Arifur Rhaman")
            ],
          );
        },
      ),
    );
    return pdf.save();
  }

  pw.Expanded itemColumn(List<CustomRowSale> elements) {
    return pw.Expanded(
      child: pw.Column(
        children: [
          for (var element in elements)
            pw.Row(
              children: [
                pw.Expanded(
                    child: pw.Text(element.date,
                        textAlign: pw.TextAlign.left)),
                pw.Expanded(
                    child: pw.Text(element.details,
                        textAlign: pw.TextAlign.right)),
                pw.Expanded(
                    child:
                    pw.Text(element.sellingPrice.toString(), textAlign: pw.TextAlign.right)),
                pw.Expanded(
                    child:
                    pw.Text(element.buyingPrice.toString(), textAlign: pw.TextAlign.right)),
                pw.Expanded(
                    child: pw.Text(element.profit.toString(), textAlign: pw.TextAlign.right)),
              ],
            )
        ],
      ),
    );
  }
  Future<void> savePdfFile(String fileName, Uint8List byteList) async {
    try {
      // final output = await getDownloadsDirectory();
      Directory? tempDir = await DownloadsPath.downloadsDirectory();
      var filePath = "${tempDir!.path}/$fileName.pdf";
      final file = File(filePath);
      print('$filePath file path');
      print('$fileName file name');

      if(await requestPermission(Permission.storage)){
        await file.writeAsBytes(byteList);
        print('Permission Accepted');
      }else{
        print('Permission Denied Writing files');
      }
      print('${file} Byte file');
      // await OpenDocument.openDocument(filePath: filePath);
      if(await requestPermission(Permission.storage)){
        await OpenFile.open(filePath).then((value){
          print(value.message.toString());
        });
        print('Permission Accepted');
      }else{
        print('Permission Denied');
      }
    } catch (e) {
      debugPrint("ERROR: $e");
    }
  }

  String getSubTotal(List<Product> products) {
    return products
        .fold(0.0,
            (double prev, element) => prev + (element.amount * element.price))
        .toStringAsFixed(2);
  }

  String getVatTotal(List<Product> products) {
    return products
        .fold(
      0.0,
          (double prev, next) =>
      prev + ((next.price / 100 * next.vatInPercent) * next.amount),
    )
        .toStringAsFixed(2);
  }

}