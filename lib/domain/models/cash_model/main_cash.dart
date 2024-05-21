import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_cash.freezed.dart';

@freezed
class MainCash with _$MainCash{
  const factory MainCash({
    required String id,
    required int amount,
    required String date
}) = _MainCash;

}