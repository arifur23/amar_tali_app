// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SaleReport {
  String get date => throw _privateConstructorUsedError;
  List<Sale> get totalSales => throw _privateConstructorUsedError;
  int get profit => throw _privateConstructorUsedError;
  int get lastDaysFor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SaleReportCopyWith<SaleReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleReportCopyWith<$Res> {
  factory $SaleReportCopyWith(
          SaleReport value, $Res Function(SaleReport) then) =
      _$SaleReportCopyWithImpl<$Res, SaleReport>;
  @useResult
  $Res call({String date, List<Sale> totalSales, int profit, int lastDaysFor});
}

/// @nodoc
class _$SaleReportCopyWithImpl<$Res, $Val extends SaleReport>
    implements $SaleReportCopyWith<$Res> {
  _$SaleReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? totalSales = null,
    Object? profit = null,
    Object? lastDaysFor = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      totalSales: null == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as List<Sale>,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as int,
      lastDaysFor: null == lastDaysFor
          ? _value.lastDaysFor
          : lastDaysFor // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaleReportImplCopyWith<$Res>
    implements $SaleReportCopyWith<$Res> {
  factory _$$SaleReportImplCopyWith(
          _$SaleReportImpl value, $Res Function(_$SaleReportImpl) then) =
      __$$SaleReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, List<Sale> totalSales, int profit, int lastDaysFor});
}

/// @nodoc
class __$$SaleReportImplCopyWithImpl<$Res>
    extends _$SaleReportCopyWithImpl<$Res, _$SaleReportImpl>
    implements _$$SaleReportImplCopyWith<$Res> {
  __$$SaleReportImplCopyWithImpl(
      _$SaleReportImpl _value, $Res Function(_$SaleReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? totalSales = null,
    Object? profit = null,
    Object? lastDaysFor = null,
  }) {
    return _then(_$SaleReportImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      totalSales: null == totalSales
          ? _value._totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as List<Sale>,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as int,
      lastDaysFor: null == lastDaysFor
          ? _value.lastDaysFor
          : lastDaysFor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SaleReportImpl implements _SaleReport {
  const _$SaleReportImpl(
      {required this.date,
      required final List<Sale> totalSales,
      required this.profit,
      required this.lastDaysFor})
      : _totalSales = totalSales;

  @override
  final String date;
  final List<Sale> _totalSales;
  @override
  List<Sale> get totalSales {
    if (_totalSales is EqualUnmodifiableListView) return _totalSales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalSales);
  }

  @override
  final int profit;
  @override
  final int lastDaysFor;

  @override
  String toString() {
    return 'SaleReport(date: $date, totalSales: $totalSales, profit: $profit, lastDaysFor: $lastDaysFor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleReportImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._totalSales, _totalSales) &&
            (identical(other.profit, profit) || other.profit == profit) &&
            (identical(other.lastDaysFor, lastDaysFor) ||
                other.lastDaysFor == lastDaysFor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date,
      const DeepCollectionEquality().hash(_totalSales), profit, lastDaysFor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleReportImplCopyWith<_$SaleReportImpl> get copyWith =>
      __$$SaleReportImplCopyWithImpl<_$SaleReportImpl>(this, _$identity);
}

abstract class _SaleReport implements SaleReport {
  const factory _SaleReport(
      {required final String date,
      required final List<Sale> totalSales,
      required final int profit,
      required final int lastDaysFor}) = _$SaleReportImpl;

  @override
  String get date;
  @override
  List<Sale> get totalSales;
  @override
  int get profit;
  @override
  int get lastDaysFor;
  @override
  @JsonKey(ignore: true)
  _$$SaleReportImplCopyWith<_$SaleReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
