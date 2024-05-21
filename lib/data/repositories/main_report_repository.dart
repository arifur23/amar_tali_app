import 'dart:io';
import 'package:amar_tali_app/data/firebase/clients/business_debt_client.dart';
import 'package:amar_tali_app/data/firebase/clients/business_expense_client.dart';
import 'package:amar_tali_app/data/firebase/clients/buy_client.dart';
import 'package:amar_tali_app/data/firebase/clients/main_cash_client.dart';
import 'package:amar_tali_app/data/firebase/clients/personal_debt_client.dart';
import 'package:amar_tali_app/data/firebase/clients/personal_expense_client.dart';
import 'package:amar_tali_app/data/firebase/clients/sale_client.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_business_debt_mapper.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_business_expense_mapper.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_buy_mapper.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_main_cash_mapper.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_personal_debt_mapper.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_personal_expense_mapper.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_sale_mapper.dart';
import 'package:amar_tali_app/data/repositories/business_debt_repository.dart';
import 'package:amar_tali_app/data/repositories/business_expense_repository.dart';
import 'package:amar_tali_app/data/repositories/buy_repository.dart';
import 'package:amar_tali_app/data/repositories/main_cash_repository.dart';
import 'package:amar_tali_app/data/repositories/personal_debt_repository.dart';
import 'package:amar_tali_app/data/repositories/personal_expense_repository.dart';
import 'package:amar_tali_app/data/repositories/sale_repository.dart';
import 'package:amar_tali_app/domain/models/business_debt_model/business_debt.dart';
import 'package:amar_tali_app/domain/models/business_debt_report_model/business_debt_report.dart';
import 'package:amar_tali_app/domain/models/business_expense_model/business_expense.dart';
import 'package:amar_tali_app/domain/models/buy_model/buy.dart';
import 'package:amar_tali_app/domain/models/cash_model/main_cash.dart';
import 'package:amar_tali_app/domain/models/final_report_model/final_report.dart';
import 'package:amar_tali_app/domain/models/personal_debt_model/personal_debt.dart';
import 'package:amar_tali_app/domain/models/personal_expense_model/personal_expense.dart';
import 'package:amar_tali_app/domain/models/sale_model/sale.dart';
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


class MainReportRepository{

  static Logger log = Logger();

  static MainCashClient mainCashClient= MainCashClient();
  static BusinessDebtClient businessDebtClient = BusinessDebtClient();
  static PersonalDebtClient personalDebtClient = PersonalDebtClient();
  static BusinessExpenseClient businessExpenseClient = BusinessExpenseClient();
  static PersonalExpenseClient personalExpenseClient = PersonalExpenseClient();
  static SaleClient saleClient = SaleClient();
  static BuyClient buyClient = BuyClient();

  static NetworkMainCashMapper networkMainCashMapper = NetworkMainCashMapper(log: log);
  static NetBusinessDebtMapper netBusinessDebtMapper = NetBusinessDebtMapper(log: log);
  static NetPersonalDebtMapper netPersonalDebtMapper = NetPersonalDebtMapper(log);
  static NetPersonalExpenseMapper netPersonalExpenseMapper = NetPersonalExpenseMapper(log: log);
  static NetBusinessExpenseMapper netBusinessExpenseMapper = NetBusinessExpenseMapper(log: log);
  static NetSaleMapper netSaleMapper = NetSaleMapper(log: log);
  static NetBuyMapper netBuyMapper = NetBuyMapper(log: log);


  // SaleReportRepository({required SaleRepository saleRepository});
  MainReportRepository();


  final MainCashRepository mainCashRepository = MainCashRepository(networkMainCashMapper: networkMainCashMapper, mainCashClient: mainCashClient);
  final BusinessExpenseRepository businessExpenseRepository = BusinessExpenseRepository(businessExpenseClient: businessExpenseClient, netBusinessExpenseMapper: netBusinessExpenseMapper);
  final PersonalExpenseRepository personalExpenseRepository = PersonalExpenseRepository(personalExpenseClient: personalExpenseClient, netPersonalExpenseMapper: netPersonalExpenseMapper);
  final BusinessDebtRepository businessDebtRepository = BusinessDebtRepository(businessDebtClient: businessDebtClient, netBusinessDebtMapper: netBusinessDebtMapper);
  final PersonalDebtRepository personalDebtRepository = PersonalDebtRepository(personalDebtClient: personalDebtClient, netPersonalDebtMapper: netPersonalDebtMapper);
  final SaleRepository saleRepository = SaleRepository(saleClient: saleClient, netSellMapper: netSaleMapper);
  final BuyRepository buyRepository = BuyRepository(buyClient: buyClient, netBuyMapper: netBuyMapper);


  Future<FinalReport> generateMainCashReportData() async{

    print('Calling from Report Repository');

    MainCash mainCash = await mainCashRepository.getMainCash();
    List<Sale> sales = await saleRepository.getAllSales();
    List<Buy> buys = await buyRepository.getAllBuy();
    List<PersonalExpense> personalExpenses = await personalExpenseRepository.getAllPersonalExpenses();
    List<PersonalDebt> personalDebts = await personalDebtRepository.getAllPersonalDebt();
    List<BusinessDebt> businessDebts = await businessDebtRepository.getAllBusinessDebt();
    List<BusinessExpense> businessExpenses = await businessExpenseRepository.getAllBusinessExpenses();


    print('Calling from Report Repository');

    return FinalReport(
        cashes: getTotalCashesFromCash(mainCash),
        sales: getTotalSalesFromSales(sales),
        buys: getTotalBuysFromBuys(buys),
        gets: getTotalGetsFromAllDebts(personalDebts, businessDebts),
        gives: getTotalGivesFromAllDebts(personalDebts, businessDebts),
        expenses: getTotalExpenseFromAllExpenses(personalExpenses, businessExpenses),
        left: (getTotalCashesFromCash(mainCash) + getTotalSalesFromSales(sales) + getTotalGetsFromAllDebts(personalDebts, businessDebts)),
        right: (getTotalBuysFromBuys(buys) + getTotalExpenseFromAllExpenses(personalExpenses, businessExpenses) +getTotalGivesFromAllDebts(personalDebts, businessDebts)),
        currentBalance: ((getTotalCashesFromCash(mainCash) + getTotalSalesFromSales(sales) + getTotalGetsFromAllDebts(personalDebts, businessDebts)) -
            (getTotalBuysFromBuys(buys) + getTotalExpenseFromAllExpenses(personalExpenses, businessExpenses) +getTotalGivesFromAllDebts(personalDebts, businessDebts))
        )
    );
  }

  int getTotalGetsFromAllDebts(List<PersonalDebt> personalDebts, List<BusinessDebt> businessDebts){
    int total = 0;
    for(var personalDebt in personalDebts){
      if(personalDebt.isGet){
        total = total + personalDebt.amount;
      }
    }
    for(var businessDebt in businessDebts){
      if(businessDebt.isGet){
        total = total + businessDebt.amount;
      }
    }
    return total;
  }

  int getTotalGivesFromAllDebts(List<PersonalDebt> personalDebts, List<BusinessDebt> businessDebts){
    int total = 0;
    for(var personalDebt in personalDebts){
      if(!personalDebt.isGet){
        total = total + personalDebt.amount;
      }
    }
    for(var businessDebt in businessDebts){
      if(!businessDebt.isGet){
        total = total + businessDebt.amount;
      }
    }
    return total;
  }

  int getTotalExpenseFromAllExpenses(List<PersonalExpense> personalExpenses, List<BusinessExpense> businessExpenses){
    int total = 0;
    for(var personalExpense in personalExpenses){
        total = total + personalExpense.amount;
    }

    for(var businessExpense in businessExpenses){
        total = total + businessExpense.amount;
    }
    return total;
  }

  int getTotalCashesFromCash(MainCash mainCash){
    int total = 0;
    try{
      total = mainCash.amount;
    }catch(e){
      print(e.toString());
    }
    return total;
  }

  int getTotalSalesFromSales(List<Sale> sales) {
    int total = 0;
    for( var sale in sales){
      total = total + sale.sellingPrice;
    }
    return total;
  }

  int getTotalBuysFromBuys(List<Buy> buys){
    int total = 0;
    for(var buy in buys){
      total = total + buy.amount;
    }
    return total;
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