import 'package:amar_tali_app/data/firebase/entities/business_expense/business_expense_entity.dart';
import 'package:amar_tali_app/domain/exception/mapper_exception.dart';
import 'package:amar_tali_app/domain/models/business_expense_model/business_expense.dart';
import 'package:logger/logger.dart';

class NetBusinessExpenseMapper{
  final Logger log;
  NetBusinessExpenseMapper({required this.log});

  BusinessExpense toBusinessExpense(BusinessExpenseEntity entity){
    try{
      return BusinessExpense(
          id: entity.id,
          details: entity.details,
          amount: entity.amount,
          date: entity.date
      );
    }catch(e){
      throw MapperException<BusinessExpenseEntity, BusinessExpense>(e.toString());
    }
  }

  List<BusinessExpense> toBusinessExpenses(List<BusinessExpenseEntity> entities){
    try{
      final List<BusinessExpense> businessExpenses = [];
      for(final entity in entities){
        businessExpenses.add(toBusinessExpense(entity));
      }
      return businessExpenses;
    }catch(e){
      throw MapperException<BusinessExpenseEntity, BusinessExpense>(e.toString());
    }
  }

}