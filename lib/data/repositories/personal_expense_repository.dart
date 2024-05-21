import 'package:amar_tali_app/data/firebase/clients/personal_expense_client.dart';
import 'package:amar_tali_app/data/firebase/entities/personal_expense/personal_expense_entity.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_business_expense_mapper.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_personal_expense_mapper.dart';
import 'package:amar_tali_app/domain/models/personal_expense_model/personal_expense.dart';

class PersonalExpenseRepository{
  final PersonalExpenseClient personalExpenseClient;
  final NetPersonalExpenseMapper netPersonalExpenseMapper;

  PersonalExpenseRepository({required this.personalExpenseClient, required this.netPersonalExpenseMapper});

  Future<PersonalExpense> getAPersonalExpense(String id) async {
    final entity = await personalExpenseClient.getAPersonalExpense(id);
    final personalExpense = netPersonalExpenseMapper.toPersonalExpense(entity);

    return personalExpense;
  }

  Future<List<PersonalExpense>> getAllPersonalExpenses() async {
    final entities = await personalExpenseClient.getAllPersonalExpenses();
    final personalExpenses = netPersonalExpenseMapper.toPersonalExpenses(entities);
    return personalExpenses;
  }

  Future<void> addPersonalExpense(String details, int amount, String date)async {

    PersonalExpenseEntity personalExpenseEntity = PersonalExpenseEntity(id: 'id', details: details, date: date, amount: amount);

    await personalExpenseClient.addAPersonalExpense(personalExpenseEntity);
  }


}