import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_debt.freezed.dart';

@freezed
class PersonalDebt with _$PersonalDebt{

  const factory PersonalDebt({
    required String id,
    required String details,
    required int amount,
    required String whom,
    required bool isGet,
    required String date
}) = _PersonalDebt;
}