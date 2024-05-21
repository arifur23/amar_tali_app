import 'package:amar_tali_app/data/repositories/sale_report_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class Product {
//   final String name;
//   final double price;
//   final double vatInPercent;
//   int amount = 0;
//
//   Product(this.name, this.price, this.vatInPercent);
// }


class TestPdfScreen extends StatefulWidget {
  const TestPdfScreen({Key? key}) : super(key: key);

  @override
  State<TestPdfScreen> createState() => _TestPdfScreenState();
}

class _TestPdfScreenState extends State<TestPdfScreen> {
  List<Product> products = [
    Product("Membership", 9.99, 19),
    Product("Nails", 0.30, 19),
    Product("Hammer", 26.43, 19),
    Product("Hamburger", 5.99, 7),
  ];
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice Generator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final currentProduct = products[index];
                  return Row(
                    children: [
                      Expanded(child: Text(currentProduct.name)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Price: ${currentProduct.price.toStringAsFixed(2)} €"),
                            Text("VAT ${currentProduct.vatInPercent.toStringAsFixed(0)} %")
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  setState(() => currentProduct.amount++);
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                currentProduct.amount.toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  setState(() => currentProduct.amount--);
                                },
                                icon: const Icon(Icons.remove),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
                itemCount: products.length,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("VAT"), Text("${getVat()} €")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("Total"), Text("${getTotal()} €")],
            ),
            ElevatedButton(
              onPressed: () async {
                // final data = await saleReportRepository.createInvoice(products);
                // saleReportRepository.savePdfFile("invoice_$number", data);
                // number++;
              },
              child: const Text("Create Invoice"),
            ),
          ],
        ),
      ),
    );
  }

  getTotal() => products
      .fold(0.0, (double prev, element) => prev + (element.price * element.amount))
      .toStringAsFixed(2);

  getVat() => products
      .fold(
      0.0,
          (double prev, element) =>
      prev + (element.price / 100 * element.vatInPercent * element.amount))
      .toStringAsFixed(2);
}

