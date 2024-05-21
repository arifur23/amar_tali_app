import 'dart:io';
import 'package:amar_tali_app/data/firebase/clients/personal_debt_client.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_personal_debt_mapper.dart';
import 'package:amar_tali_app/data/repositories/personal_debt_repository.dart';
import 'package:amar_tali_app/domain/models/business_debt_report_model/business_debt_report.dart';
import 'package:amar_tali_app/domain/models/personal_debt_model/personal_debt.dart';
import 'package:amar_tali_app/domain/models/personal_debt_report_model/personal_debt_report.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:logger/logger.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

class CustomRowPersonalDebt {
  final String date;
  final String details;
  final int amount;
  final String get;
  final String give;

  CustomRowPersonalDebt( {required this.date, required this.details, required this.amount, required this.get, required this.give});
}


class PersonalDebtReportRepository{

  static Logger log = Logger();
  static PersonalDebtClient personalDebtClient= PersonalDebtClient();
  static NetPersonalDebtMapper netPersonalDebtMapper = NetPersonalDebtMapper(log);

  // SaleReportRepository({required SaleRepository saleRepository});
  PersonalDebtReportRepository();


  final PersonalDebtRepository personalDebtRepository = PersonalDebtRepository(personalDebtClient: personalDebtClient, netPersonalDebtMapper: netPersonalDebtMapper);

  Future<PersonalDebtReport> generatePersonalDebtReportData() async{

    print('Calling from Report Repository');

    List<PersonalDebt> totalPersonalDebt = await personalDebtRepository.getAllPersonalDebt();
    print('Calling from Report Repository');

    return PersonalDebtReport(date: '', personalDebt: totalPersonalDebt, totalDebts: getTotalPersonalDebtFromDebt(totalPersonalDebt), lastDaysFor: 7);
  }

  int getTotalPersonalDebtFromDebt(List<PersonalDebt> totalPersonalDebts){
    int totalPersonalDebt = 0;
    try{
      for(var personalDebt in totalPersonalDebts){
        if(personalDebt.isGet){
          totalPersonalDebt = totalPersonalDebt - personalDebt.amount;
        }else{
          totalPersonalDebt = totalPersonalDebt + personalDebt.amount;
        }
      }
    }catch(e){
      print(e.toString());
    }
    return totalPersonalDebt;
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

  Future<Uint8List> createInvoice(BusinessDebtReport businessDebtReport,) async {
    final pdf = pw.Document();


    final List<CustomRowPersonalDebt> elements = [
      for (var debt in businessDebtReport.businessDebt)
        CustomRowPersonalDebt(
            date: debt.date,
            details: debt.details,
            amount:debt.amount,
            get: debt.isGet ? "Get" : "",
            give: debt.isGet ? " " : "Give"
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
                  "Dear Admin, thanks for Using our App, feel free to see the list of Personal Debt Report below."),
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
                          child: pw.Text('Get',
                              textAlign: pw.TextAlign.right),
                        ),
                        pw.Expanded(
                          child: pw.Text('Give',
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
                          child: pw.Text('        '),
                        ),
                        pw.Expanded(
                          child: pw.Text('        '),
                        ),
                        pw.Expanded(
                          child: pw.Text(businessDebtReport.totalDebts.toString(),
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

  pw.Expanded itemColumn(List<CustomRowPersonalDebt> elements) {
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
                    child: pw.Text(element.get.toString(), textAlign: pw.TextAlign.right)),
                pw.Expanded(
                    child: pw.Text(element.give.toString(), textAlign: pw.TextAlign.right)),
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