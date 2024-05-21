import 'package:amar_tali_app/domain/models/business_expense_model/business_expense.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'business_expense_report.freezed.dart';


@freezed
class BusinessExpenseReport with _$BusinessExpenseReport{
  const factory BusinessExpenseReport({
    required String date,
    required List<BusinessExpense> businessExpenses,
    required int totalExpenses,
    required int lastDaysFor,
  }) =_BusinessExpenseReport;
}