import 'package:amar_tali_app/domain/models/personal_debt_model/personal_debt.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_debt_report.freezed.dart';


@freezed
class PersonalDebtReport with _$PersonalDebtReport{
  const factory PersonalDebtReport({
    required String date,
    required List<PersonalDebt> personalDebt,
    required int totalDebts,
    required int lastDaysFor,
  }) =_PersonalDebtReport;
}