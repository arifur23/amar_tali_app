import 'package:amar_tali_app/data/firebase/clients/business_debt_client.dart';
import 'package:amar_tali_app/data/firebase/clients/buy_client.dart';
import 'package:amar_tali_app/data/firebase/clients/main_cash_client.dart';
import 'package:amar_tali_app/data/firebase/clients/personal_debt_client.dart';
import 'package:amar_tali_app/data/firebase/clients/personal_expense_client.dart';
import 'package:amar_tali_app/data/firebase/clients/sale_client.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_business_expense_mapper.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_buy_mapper.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_main_cash_mapper.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_personal_debt_mapper.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_personal_expense_mapper.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_sale_mapper.dart';
import 'package:amar_tali_app/data/repositories/auth_repository.dart';
import 'package:amar_tali_app/data/repositories/business_debt_repository.dart';
import 'package:amar_tali_app/data/repositories/business_expense_report_repository.dart';
import 'package:amar_tali_app/data/repositories/buy_repository.dart';
import 'package:amar_tali_app/data/repositories/main_cash_repository.dart';
import 'package:amar_tali_app/data/repositories/main_report_repository.dart';
import 'package:amar_tali_app/data/repositories/network_repository.dart';
import 'package:amar_tali_app/data/repositories/personal_debt_report_repository.dart';
import 'package:amar_tali_app/data/repositories/personal_debt_repository.dart';
import 'package:amar_tali_app/data/repositories/personal_expense_report_repository.dart';
import 'package:amar_tali_app/data/repositories/personal_expense_repository.dart';
import 'package:amar_tali_app/data/repositories/sale_report_repository.dart';
import 'package:amar_tali_app/data/repositories/sale_repository.dart';
import 'package:amar_tali_app/presentation/Authentication/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'data/firebase/clients/business_expense_client.dart';
import 'data/firebase/mappers/network_business_debt_mapper.dart';
import 'data/repositories/business_debt_report_repository.dart';
import 'data/repositories/business_expense_repository.dart';

class InitialData {
  final List<SingleChildWidget> providers;
  InitialData({required this.providers});
}

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final data = await _createInitialData();
  runApp( MyApp(data: data,));
}

Future<InitialData> _createInitialData() async{

  final log = Logger(
    printer: PrettyPrinter(),
    level: kDebugMode ? Level.trace : Level.off,
  );

  final authenticationRepository = AuthenticationRepository();
  final netBusinessDebtMapper = NetBusinessDebtMapper(log:log);
  final netBusinessExpense = NetBusinessExpenseMapper(log: log);
  final netPersonalDebtMapper = NetPersonalDebtMapper(log);
  final netPersonalExpenseMapper = NetPersonalExpenseMapper(log: log);
  final netSellMapper = NetSaleMapper(log: log);
  final netBuyMapper = NetBuyMapper(log: log);

  final businessDebtClient = BusinessDebtClient();
  final businessExpenseClient = BusinessExpenseClient();
  final personalDebtClient = PersonalDebtClient();
  final personalExpenseClient = PersonalExpenseClient();
  final sellClient = SaleClient();
  final buyClient = BuyClient();

  final mainCashClient = MainCashClient();
  final netMainCashMapper = NetworkMainCashMapper(log: log);

  final businessDebtRepository = BusinessDebtRepository(businessDebtClient: businessDebtClient, netBusinessDebtMapper: netBusinessDebtMapper );
  final businessExpenseRepository = BusinessExpenseRepository(businessExpenseClient: businessExpenseClient, netBusinessExpenseMapper: netBusinessExpense );
  final personalDebtRepository = PersonalDebtRepository(personalDebtClient: personalDebtClient, netPersonalDebtMapper: netPersonalDebtMapper);
  final personalExpenseRepository = PersonalExpenseRepository(personalExpenseClient: personalExpenseClient, netPersonalExpenseMapper: netPersonalExpenseMapper);
  final sellRepository = SaleRepository(saleClient: sellClient, netSellMapper: netSellMapper);
  final buyRepository = BuyRepository(buyClient: buyClient, netBuyMapper: netBuyMapper);
  final mainCashRepository = MainCashRepository(networkMainCashMapper: netMainCashMapper, mainCashClient: mainCashClient);
  final netConnectivityRepository = NetworkRepository();
  final saleReportRepository = SaleReportRepository();
  final personalExpenseReportRepository = PersonalExpenseReportRepository();
  final businessExpenseReportRepository = BusinessExpenseReportRepository();
  final businessDebtReportRepository = BusinessDebtReportRepository();
  final personalDebtReportRepository = PersonalDebtReportRepository();
  final MainReportRepository mainReportRepository = MainReportRepository();


  return InitialData(
      providers: [
        Provider<BusinessDebtRepository>.value(value: businessDebtRepository),
        Provider<BusinessExpenseRepository>.value(value: businessExpenseRepository),
        Provider<PersonalExpenseRepository>.value(value: personalExpenseRepository),
        Provider<PersonalDebtRepository>.value(value: personalDebtRepository),
        Provider<SaleRepository>.value(value: sellRepository),
        Provider<BuyRepository>.value(value: buyRepository),
        Provider<MainCashRepository>.value(value: mainCashRepository),
        StreamProvider<NetworkStatus>(
          create: (context) =>
          NetworkRepository().networkStatusController.stream,
          initialData: NetworkStatus.Online,
        ),
        Provider<SaleReportRepository>.value(value: saleReportRepository),
        Provider<PersonalExpenseReportRepository>.value(value: personalExpenseReportRepository),
        Provider<BusinessExpenseReportRepository>.value(value: businessExpenseReportRepository),
        Provider<BusinessDebtReportRepository>.value(value: businessDebtReportRepository),
        Provider<PersonalDebtReportRepository>.value(value: personalDebtReportRepository),
        Provider<MainReportRepository>.value(value: mainReportRepository),
        ChangeNotifierProvider<AuthenticationRepository>.value(value: authenticationRepository)
      ]
  );
}

class MyApp extends StatelessWidget {
  final InitialData data;

  const MyApp({super.key, required this.data});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: data.providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}

