import 'package:amar_tali_app/domain/models/business_debt_model/business_debt.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_debt_report.freezed.dart';


@freezed
class BusinessDebtReport with _$BusinessDebtReport{
  const factory BusinessDebtReport({
    required String date,
    required List<BusinessDebt> businessDebt,
    required int totalDebts,
    required int lastDaysFor,
}) =_BusinessDebtReport;
}