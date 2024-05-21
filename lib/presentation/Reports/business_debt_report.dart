import 'package:amar_tali_app/data/repositories/business_debt_report_repository.dart';
import 'package:amar_tali_app/domain/models/business_debt_report_model/business_debt_report.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class BusinessDebtReportScreen extends StatefulWidget {
  const BusinessDebtReportScreen({Key? key}) : super(key: key);

  @override
  State<BusinessDebtReportScreen> createState() => _BusinessDebtReportScreenState();
}

class _BusinessDebtReportScreenState extends State<BusinessDebtReportScreen> {

  int number = 0;

  @override
  Widget build(BuildContext context) {
    var businessDebtReportRepository =  Provider.of<BusinessDebtReportRepository>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Business Debt Report"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              color: Colors.red,
              height: 40,
              child: const Padding(
                padding:  EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Date ",
                    textAlign: TextAlign.left,),
                    Text("Details",
                      textAlign: TextAlign.right,),
                    Text("Get",
                      textAlign: TextAlign.right),
                    Text("Give ",
                      textAlign: TextAlign.right,),
                    Text("Amount",
                      textAlign: TextAlign.right,),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: 500,
              child: FutureBuilder<BusinessDebtReport>(
                builder: (context, snapShot){
                  if(snapShot.hasError){
                    return LoadingAnimationWidget.fourRotatingDots(
                      size: 50,
                      color: Colors.blue,
                    );
                  }
                  else if(!snapShot.hasData){
                    return LoadingAnimationWidget.fourRotatingDots(
                      size: 50,
                      color: Colors.blue,
                    );
                  }
                  else{
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              final currentDebt = snapShot.data!.businessDebt;
                              return Padding(
                                padding:  const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(child: Text(currentDebt[index].date,
                                      textAlign: TextAlign.left,)),
                                    Expanded(child: Text(currentDebt[index].details,
                                      textAlign: TextAlign.right)),
                                    Expanded(child: currentDebt[index].isGet ? const Text('Get',
                                      textAlign: TextAlign.right) : const Text('')),
                                    Expanded(child: currentDebt[index].isGet ? const Text('') : const Text('Give',
                                      textAlign: TextAlign.right,)),
                                    Expanded(child: Text(currentDebt[index].amount.toString(),
                                      textAlign: TextAlign.right,))
                                  ],
                                ),
                              );
                            },
                            itemCount: snapShot.data!.businessDebt.length,
                            shrinkWrap: true,
                          ),
                        ),
                        Container(
                          color: Colors.red,
                          height: 40,
                          child: Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total "),
                                Text("        "),
                                Text("       "),
                                Text("        "),
                                Text("${snapShot.data!.totalDebts}"),
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final data = await businessDebtReportRepository.createInvoice(snapShot.data as BusinessDebtReport);
                            businessDebtReportRepository.savePdfFile("business_debt_invoice_$number", data);
                            // number++;
                          },
                          child: const Text("Create Invoice"),
                        ),
                      ],
                    );
                  }
                },
                future: businessDebtReportRepository.generateBusinessDebtReportData(),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

