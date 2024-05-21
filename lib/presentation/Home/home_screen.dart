import 'package:amar_tali_app/presentation/BusinessDebt/business_debt_screen.dart';
import 'package:amar_tali_app/presentation/BusinessExpense/business_expense_screen.dart';
import 'package:amar_tali_app/presentation/Home/home_item.dart';
import 'package:amar_tali_app/presentation/PersonalDebt/personal_debt_screen.dart';
import 'package:amar_tali_app/presentation/PersonalExpense/personal_expense_screen.dart';
import 'package:amar_tali_app/presentation/Sale/sale_screen.dart';
import 'package:amar_tali_app/presentation/main/main_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Amar Tali App'),
        backgroundColor: Colors.grey,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeItem(
                        size: size,
                        secondColor: const Color(0xffae92ff),
                        firstColor: const Color(0xff8257ff),
                        title: 'Personal Expense',
                        icon: Icons.details,
                        child: const PersonalExpenseScreen(),
                      ),
                      HomeItem(
                        size: size,
                        secondColor: const Color(0xffff46e2),
                        firstColor: const Color(0xffff8bed),
                        title: 'Business Expense',
                        icon: Icons.details,
                        child: const BusinessExpenseScreen(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeItem(
                        size: size,
                        secondColor: const Color(0xffae92ff),
                        firstColor: const Color(0xff8257ff),
                        title: 'Business Debt',
                        icon: Icons.details,
                        child: const BusinessDebtScreen(),
                      ),
                      HomeItem(
                        size: size,
                        secondColor: const Color(0xffff46e2),
                        firstColor: const Color(0xffff8bed),
                        title: 'Personal Debt',
                        icon: Icons.details,
                        child: const PersonalDebtScreen(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeItem(
                        size: size,
                        secondColor: const Color(0xffae92ff),
                        firstColor: const Color(0xff8257ff),
                        title: 'Sales Screen',
                        icon: Icons.details,
                        child: const SaleScreen(),
                      ),
                      HomeItem(
                        size: size,
                        secondColor: const Color(0xffff46e2),
                        firstColor: const Color(0xffff8bed),
                        title: 'Main Section',
                        icon: Icons.details,
                        child: const MainScreen(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
