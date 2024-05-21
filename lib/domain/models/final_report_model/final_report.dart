import 'package:freezed_annotation/freezed_annotation.dart';

part 'final_report.freezed.dart';

@freezed
class FinalReport with _$FinalReport{
  const factory FinalReport({
    required int cashes,
    required int sales,
    required int buys,
    required int gets,
    required int gives,
    required int expenses,
    required int left,
    required int right,
    required int currentBalance,
})= _FinalReport;
}