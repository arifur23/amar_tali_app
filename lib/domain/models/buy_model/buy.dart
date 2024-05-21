import 'package:freezed_annotation/freezed_annotation.dart';

part 'buy.freezed.dart';

@freezed
class Buy with _$Buy {
  const factory Buy({
    required String id,
    required String details,
    required int amount,
    required String date,
}) = _Buy;

}