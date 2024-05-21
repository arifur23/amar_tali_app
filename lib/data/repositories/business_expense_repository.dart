import 'package:amar_tali_app/data/firebase/clients/business_expense_client.dart';
import 'package:amar_tali_app/data/firebase/entities/business_expense/business_expense_entity.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_business_expense_mapper.dart';
import 'package:amar_tali_app/domain/models/business_expense_model/business_expense.dart';

class BusinessExpenseRepository{
  final BusinessExpenseClient businessExpenseClient;
  final NetBusinessExpenseMapper netBusinessExpenseMapper;

  BusinessExpenseRepository({required this.businessExpenseClient, required this.netBusinessExpenseMapper});

  Future<BusinessExpense> getABusinessExpense(String id) async {
    final entity = await businessExpenseClient.getABusinessExpense(id);
    final businessExpense = netBusinessExpenseMapper.toBusinessExpense(entity);

    return businessExpense;
  }

  Future<List<BusinessExpense>> getAllBusinessExpenses() async{
    final entities = await businessExpenseClient.getAllBusinessExpenses();
    final businessExpenses = netBusinessExpenseMapper.toBusinessExpenses(entities);

    return businessExpenses;
  }

  Future<void> addAExpense( String details, int amount, String date) async{
    BusinessExpenseEntity businessExpenseEntity = BusinessExpenseEntity(id: 'id', details: details, date: date, amount: amount);

    await businessExpenseClient.addABusinessExpense(businessExpenseEntity);
  }
}