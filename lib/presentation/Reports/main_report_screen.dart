import 'package:amar_tali_app/data/repositories/main_report_repository.dart';
import 'package:amar_tali_app/domain/models/cash_model/main_cash.dart';
import 'package:amar_tali_app/domain/models/final_report_model/final_report.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class MainReportScreen extends StatefulWidget {
  const MainReportScreen({Key? key}) : super(key: key);

  @override
  State<MainReportScreen> createState() => _MainReportScreenState();
}

class _MainReportScreenState extends State<MainReportScreen> {
  @override
  Widget build(BuildContext context) {
    var mainReportRepository = Provider.of<MainReportRepository>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Cash Report"),
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
                      Text("Cash", style: TextStyle(fontSize: 12),),
                      Text("Sales", style: TextStyle(fontSize: 12)),
                      Text("Buys", style: TextStyle(fontSize: 12)),
                      Text("Gets", style: TextStyle(fontSize: 12)),
                      Text("Gives", style: TextStyle(fontSize: 12)),
                      Text("Expenses", style: TextStyle(fontSize: 12)),
                      Text("Left", style: TextStyle(fontSize: 12)),
                      Text("Right", style: TextStyle(fontSize: 12)),
                      Text("Current Balance", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: (300),
                child: FutureBuilder<FinalReport>(
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
                                final currentExpense = snapShot.data!;
                                return Container(
                                  color: Colors.red,
                                  height: 40,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(child: Text(currentExpense.cashes.toString(), textAlign: TextAlign.left,)),
                                        Expanded(child: Text(currentExpense.sales.toString(), textAlign: TextAlign.left,)),
                                        Expanded(child: Text(currentExpense.buys.toString(), textAlign: TextAlign.left,)),
                                        Expanded(child: Text(currentExpense.gets.toString(), textAlign: TextAlign.left,)),
                                        Expanded(child: Text(currentExpense.gives.toString(), textAlign: TextAlign.left,)),
                                        Expanded(child: Text(currentExpense.expenses.toString(), textAlign: TextAlign.left,)),
                                        Expanded(child: Text(currentExpense.left.toString(), textAlign: TextAlign.left,)),
                                        Expanded(child: Text(currentExpense.right.toString(), textAlign: TextAlign.left,)),
                                        Expanded(child: Text(currentExpense.currentBalance.toString(), textAlign: TextAlign.left,)),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: 1,
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
                                  Text("${snapShot.data!.currentBalance}"),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          ElevatedButton(
                            onPressed: () async {
                              // print('object');
                              // final data = await personalExpenseReportRepository.createInvoice(snapShot.data as PersonalExpenseReport);
                              // personalExpenseReportRepository.savePdfFile("personal_expense_invoice_$number", data);
                              // number++;
                            },
                            child: const Text("Create Invoice"),
                          ),
                        ],
                      );
                    }
                  },
                  future: mainReportRepository.generateMainCashReportData(),
                ),
              ),
            ],
          ),
        ),


      ),
    );
  }
}
