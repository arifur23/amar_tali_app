import 'package:amar_tali_app/domain/models/personal_expense_model/personal_expense.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_expense_report.freezed.dart';


@freezed
class PersonalExpenseReport with _$PersonalExpenseReport{
  const factory PersonalExpenseReport({
    required String date,
    required List<PersonalExpense> personalExpense,
    required int totalExpenses,
    required int lastDaysFor,
  }) =_PersonalExpenseReport;
}