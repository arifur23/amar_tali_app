import 'dart:io';
import 'package:amar_tali_app/data/firebase/clients/business_expense_client.dart';
import 'package:amar_tali_app/data/firebase/clients/personal_expense_client.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_personal_expense_mapper.dart';
import 'package:amar_tali_app/data/repositories/business_expense_repository.dart';
import 'package:amar_tali_app/data/repositories/personal_expense_repository.dart';
import 'package:amar_tali_app/domain/models/business_expense_model/business_expense.dart';
import 'package:amar_tali_app/domain/models/business_expense_report_model/business_expense_report.dart';
import 'package:amar_tali_app/domain/models/personal_expense_model/personal_expense.dart';
import 'package:amar_tali_app/domain/models/personal_expense_report_model/personal_expense_report.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:logger/logger.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../firebase/mappers/network_business_expense_mapper.dart';


class CustomRowBusinessExpense {
  final String date;
  final String details;
  final int amount;

  CustomRowBusinessExpense({required this.date, required this.details, required this.amount});
}


class BusinessExpenseReportRepository{

  static Logger log = Logger();
  static BusinessExpenseClient businessExpenseClient= BusinessExpenseClient();
  static NetBusinessExpenseMapper netBusinessExpenseMapper = NetBusinessExpenseMapper(log: log);

  // SaleReportRepository({required SaleRepository saleRepository});
  BusinessExpenseReportRepository();


  final BusinessExpenseRepository businessExpenseRepository = BusinessExpenseRepository(businessExpenseClient: businessExpenseClient, netBusinessExpenseMapper: netBusinessExpenseMapper);

  Future<BusinessExpenseReport> generateBusinessExpenseReportData() async{

    List<BusinessExpense> totalBusinessExpenses = await businessExpenseRepository.getAllBusinessExpenses();

    return BusinessExpenseReport(date: '', businessExpenses: totalBusinessExpenses, totalExpenses: getTotalBusinessExpenseFromExpenses(totalBusinessExpenses), lastDaysFor: 7);
  }

  int getTotalBusinessExpenseFromExpenses(List<BusinessExpense> totalBusinessExpenses){
    int totalBusinessExpense = 0;
    try{
      for(var businessExpense in totalBusinessExpenses){
        totalBusinessExpense = totalBusinessExpense + businessExpense.amount;
      }
    }catch(e){
      print(e.toString());
    }
    return totalBusinessExpense;
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

  Future<Uint8List> createInvoice(BusinessExpenseReport businessExpenseReport,) async {
    final pdf = pw.Document();


    final List<CustomRowBusinessExpense> elements = [
      for (var expense in businessExpenseReport.businessExpenses)
        CustomRowBusinessExpense(
            date: expense.date,
            details: expense.details,
            amount:expense.amount
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
                  "Dear Admin, thanks for Using our App, feel free to see the list of Business Expense Report below."),
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
                          child: pw.Text('Amount',
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
                          child: pw.Text(businessExpenseReport.totalExpenses.toString(),
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

  pw.Expanded itemColumn(List<CustomRowBusinessExpense> elements) {
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
                    child: pw.Text(element.amount.toString(), textAlign: pw.TextAlign.right)),
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

}