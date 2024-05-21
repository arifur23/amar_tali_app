import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_expense.freezed.dart';


@freezed
class PersonalExpense with _$PersonalExpense{
  const factory PersonalExpense({
    required String id,
    required String details,
    required int amount,
    required String date
  }) = _PersonalExpense;

}