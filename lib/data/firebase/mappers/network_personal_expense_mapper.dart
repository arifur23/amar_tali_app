import 'package:logger/logger.dart';
import '../../../domain/exception/mapper_exception.dart';
import '../../../domain/models/personal_expense_model/personal_expense.dart';
import '../entities/personal_expense/personal_expense_entity.dart';

class NetPersonalExpenseMapper{
  final Logger log;
  NetPersonalExpenseMapper({required this.log});

  PersonalExpense toPersonalExpense(PersonalExpenseEntity entity){
    try{
      return PersonalExpense(
          id: entity.id,
          details: entity.details,
          amount: entity.amount,
          date: entity.date
      );
    }catch(e){
      throw MapperException<PersonalExpenseEntity, PersonalExpense>(e.toString());
    }
  }

  List<PersonalExpense> toPersonalExpenses(List<PersonalExpenseEntity> entities){
    try{
      final List<PersonalExpense> personalExpenses = [];
      for(final entity in entities){
        personalExpenses.add(toPersonalExpense(entity));
      }
      return personalExpenses;
    }catch(e){
      throw MapperException<PersonalExpenseEntity, PersonalExpense>(e.toString());
    }
  }

}