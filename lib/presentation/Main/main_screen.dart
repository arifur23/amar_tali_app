import 'package:amar_tali_app/data/repositories/main_cash_repository.dart';
import 'package:amar_tali_app/presentation/Common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import '../Reports/main_report_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TextEditingController updateCashController;
  final formKey8 = GlobalKey<FormState>();

  bool iSGet = false;

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
    updateCashController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var mainCashRepository = Provider.of<MainCashRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Business Cash', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => const MainReportScreen()
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
                key: formKey8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30,),CustomTextField(name: 'Add Cash Amount', controller: updateCashController, prefixIcon: Icons.remove, inputType: TextInputType.number, hintText: 'Please Enter valid Amount',),
                    const SizedBox(height: 20,),
                    const SizedBox(height: 20,),
                    Container(
                      height: 50,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Choose a date', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              height: 50,
                              width: 180,
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(130)
                              ),
                              child:  Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(Icons.calendar_today_outlined, ),
                                    GestureDetector(
                                        onTap: (){
                                          _selectDate(context);
                                        },
                                        child: Text(selectedDate != null ?   selectedDate.toString() : 'date', style: const TextStyle(overflow: TextOverflow.ellipsis ,fontWeight: FontWeight.w500, fontSize: 14),)
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
                        if (formKey8.currentState!.validate()) {
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
                                          'Sure to Add Cash Amount'),
                                      const SizedBox(height: 80,),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
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
                                              onTap: () async {

                                                setState(() {
                                                  loading =true;
                                                });
                                                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                                  return const Scaffold(
                                                    body: Center(
                                                      child: CircularProgressIndicator(),
                                                    ),
                                                  );
                                                }));
                                                int counter = 0;
                                                mainCashRepository.updateMainCash(int.parse(updateCashController.text), selectedDate.toString()).then((value){
                                                  Navigator.of(context).popUntil((route) => counter++ >= 1);
                                                });
                                                updateCashController.clear();
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //     builder: (context) => const SimpleCircularProgressBar(),
                                                //   ),
                                                // );
                                                setState(() {
                                                  loading = false;
                                                });

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
                                                  child: Text('Add Cash'),
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
                          child: Text('Add Cash', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white),),
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
