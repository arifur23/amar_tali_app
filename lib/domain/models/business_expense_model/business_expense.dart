import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_expense.freezed.dart';


@freezed
class BusinessExpense with _$BusinessExpense{
  const factory BusinessExpense({
    required String id,
    required String details,
    required int amount,
    required String date
}) = _BusinessExpense;
}