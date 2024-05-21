import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale.freezed.dart';

@freezed
class Sale with _$Sale{
const factory Sale({
  required String id,
  required String details,
  required int sellingPrice,
  required int buyingPrice,
  required String date
}) = _Sale;
}