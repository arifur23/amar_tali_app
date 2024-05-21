import 'package:amar_tali_app/domain/models/sale_model/sale.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_report.freezed.dart';

@freezed
class SaleReport with _$SaleReport{
  const factory SaleReport({
    required String date,
    required List<Sale> totalSales,
    required int profit,
    required int lastDaysFor
}) = _SaleReport;
}