import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_debt.freezed.dart';

@freezed
class BusinessDebt with _$BusinessDebt{
  const factory BusinessDebt({
    required String id,
    required String details,
    required int amount,
    required String whom,
    required bool isGet,
    required String date
}) = _BusinessDebt;
}