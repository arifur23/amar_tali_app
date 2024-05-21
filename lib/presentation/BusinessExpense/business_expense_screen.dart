import 'package:amar_tali_app/data/repositories/business_expense_repository.dart';
import 'package:amar_tali_app/presentation/Common/custom_textfield.dart';
import 'package:amar_tali_app/presentation/Reports/business_expense_report.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BusinessExpenseScreen extends StatefulWidget {
  const BusinessExpenseScreen({Key? key}) : super(key: key);

  @override
  State<BusinessExpenseScreen> createState() => _BusinessExpenseScreenState();
}

class _BusinessExpenseScreenState extends State<BusinessExpenseScreen> {

  late TextEditingController amountController;
  late TextEditingController detailsController;
  final formKey2 = GlobalKey<FormState>();

  bool loading = false;

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    amountController = TextEditingController();
    detailsController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var businessExpenseRepository = Provider.of<BusinessExpenseRepository>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Expense'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => const BusinessExpenseReportScreen()
              ));
            },
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[100]
              ),
              child: const Center(child: Text('Report', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.lightGreen),)),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical:  10),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Form(
                key: formKey2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30,),
                    CustomTextField(name: 'Details', controller: detailsController, prefixIcon: Icons.receipt, inputType: TextInputType.text, hintText: 'Please Enter valid Details',),
                    CustomTextField(name: 'Amount', controller: amountController, prefixIcon: Icons.remove, inputType: TextInputType.number, hintText: 'Please Enter valid Amount',),
                    const SizedBox(height: 20,),
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Choose a date', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              height: 50,
                              width: 180,
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(130)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(Icons.calendar_today_outlined, ),
                                    GestureDetector(
                                        onTap: (){
                                          _selectDate(context);
                                        },
                                        child: Text(selectedDate != null ?   selectedDate.toString() : 'date', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),)
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30,),
                    GestureDetector(
                      onTap: (){
                        if (formKey2.currentState!.validate()) {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: size.height * .4,
                                  width: size.width * .9,
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 30,),
                                      const Text(
                                          'Sure to Add Business Expense'),
                                      const SizedBox(height: 80,),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                height: 70,
                                                width: 130,
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius: BorderRadius
                                                        .circular(30)
                                                ),
                                                child: const Center(
                                                  child: Text('Cancel'),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  loading =true;
                                                });
                                                loading ? const CircularProgressIndicator() : null;
                                                 businessExpenseRepository.addAExpense(detailsController.text, int.parse(amountController.text), selectedDate.toString()).then((value){
                                                });
                                                setState(() {
                                                  loading = false;
                                                });
                                                amountController.clear();
                                                detailsController.clear();

                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: 70,
                                                width: 130,
                                                decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius: BorderRadius
                                                        .circular(30)
                                                ),
                                                child: const Center(
                                                  child: Text('Add Expense'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        }
                      },
                      child: Container(
                        height: 45,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue,
                        ),
                        child: const Center(
                          child: Text('Add Debt', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
