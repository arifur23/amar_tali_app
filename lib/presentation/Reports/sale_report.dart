import 'package:amar_tali_app/data/repositories/sale_report_repository.dart';
import 'package:amar_tali_app/domain/models/sale_report_model/sale_report.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class SaleReportScreen extends StatefulWidget {
  const SaleReportScreen({Key? key}) : super(key: key);

  @override
  State<SaleReportScreen> createState() => _SaleReportScreenState();
}

class _SaleReportScreenState extends State<SaleReportScreen> {

  int number = 0;
  @override
  Widget build(BuildContext context) {
    var saleReportRepository =  Provider.of<SaleReportRepository>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sales Report"),
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
                    Text("Date "),
                    Text("Details "),
                    Text("Selling Price "),
                    Text("Buying Price "),
                    Text("Profit "),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: (300),
              child: FutureBuilder<SaleReport>(
                builder: (context, snapShot){
                  int totalSalingPrice = 0;
                  int totalBuyingPrice = 0;
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
                    for(var sale in snapShot.data!.totalSales){
                      totalSalingPrice = totalSalingPrice + sale.sellingPrice;
                    }
                    for(var buy in snapShot.data!.totalSales){
                      totalBuyingPrice = (totalBuyingPrice + buy.buyingPrice);
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              final currentSale = snapShot.data!.totalSales;
                              return Container(
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(child: Text(currentSale[index].date, textAlign: TextAlign.left,)),
                                      Expanded(child: Text(currentSale[index].details, textAlign: TextAlign.right,)),
                                      Expanded(child: Text(currentSale[index].sellingPrice.toString(), textAlign: TextAlign.right,)),
                                      Expanded(child: Text(currentSale[index].buyingPrice.toString(), textAlign: TextAlign.right,)),
                                      Expanded(child: Text(((currentSale[index].sellingPrice) - (currentSale[index].buyingPrice)).toString(), textAlign: TextAlign.right,)),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: snapShot.data!.totalSales.length,
                            shrinkWrap: true,
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("VAT"), Text(" €")],
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
                                const Text("Total ", textAlign: TextAlign.left,),
                                const Text("    "),
                                Text("$totalSalingPrice", textAlign: TextAlign.right,),
                                Text("$totalBuyingPrice", textAlign: TextAlign.right,),
                                Text("${snapShot.data!.profit}", textAlign: TextAlign.right,),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        ElevatedButton(
                          onPressed: () async {
                            print('object');
                            final data = await saleReportRepository.createInvoice(snapShot.data as SaleReport);
                            saleReportRepository.savePdfFile("invoice_$number", data);
                            number++;
                          },
                          child: const Text("Create Invoice"),
                        ),
                      ],
                    );
                  }
                },
                future: saleReportRepository.generateSaleReportData(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

