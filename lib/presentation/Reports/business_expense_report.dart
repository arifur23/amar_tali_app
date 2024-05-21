import 'package:amar_tali_app/data/repositories/business_expense_report_repository.dart';
import 'package:amar_tali_app/domain/models/business_expense_report_model/business_expense_report.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class BusinessExpenseReportScreen extends StatefulWidget {
  const BusinessExpenseReportScreen({Key? key}) : super(key: key);

  @override
  State<BusinessExpenseReportScreen> createState() => _BusinessExpenseReportScreenState();
}

class _BusinessExpenseReportScreenState extends State<BusinessExpenseReportScreen> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    var businessExpenseReportRepository =  Provider.of<BusinessExpenseReportRepository>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Business Expense Report"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
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
                      Text("Date "),
                      Text("Details "),
                      Text("Amount "),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: (300),
                child: FutureBuilder<BusinessExpenseReport>(
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
                                final currentExpense = snapShot.data!.businessExpenses;
                                return Container(
                                  color: Colors.red,
                                  height: 40,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(child: Text(currentExpense[index].date,textAlign: TextAlign.left,)),
                                        Expanded(child: Text(currentExpense[index].details,textAlign: TextAlign.right,)),
                                        Expanded(child: Text(currentExpense[index].amount.toString(),textAlign: TextAlign.right,)),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: snapShot.data!.businessExpenses.length,
                              shrinkWrap: true,
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Container(
                            color: Colors.red,
                            height: 40,
                            child:  Padding(
                              padding:  const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Total "),
                                  const Text("    "),
                                  Text("${snapShot.data!.totalExpenses}"),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          ElevatedButton(
                            onPressed: () async {
                              print('object');
                              final data = await businessExpenseReportRepository.createInvoice(snapShot.data as BusinessExpenseReport);
                              businessExpenseReportRepository.savePdfFile("business_expense_invoice_$number", data);
                              number++;
                            },
                            child: const Text("Create Invoice"),
                          ),
                        ],
                      );
                    }
                  },
                  future: businessExpenseReportRepository.generateBusinessExpenseReportData(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

