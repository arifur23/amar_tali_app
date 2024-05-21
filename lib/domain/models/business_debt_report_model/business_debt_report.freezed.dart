// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_debt_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BusinessDebtReport {
  String get date => throw _privateConstructorUsedError;
  List<BusinessDebt> get businessDebt => throw _privateConstructorUsedError;
  int get totalDebts => throw _privateConstructorUsedError;
  int get lastDaysFor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BusinessDebtReportCopyWith<BusinessDebtReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessDebtReportCopyWith<$Res> {
  factory $BusinessDebtReportCopyWith(
          BusinessDebtReport value, $Res Function(BusinessDebtReport) then) =
      _$BusinessDebtReportCopyWithImpl<$Res, BusinessDebtReport>;
  @useResult
  $Res call(
      {String date,
      List<BusinessDebt> businessDebt,
      int totalDebts,
      int lastDaysFor});
}

/// @nodoc
class _$BusinessDebtReportCopyWithImpl<$Res, $Val extends BusinessDebtReport>
    implements $BusinessDebtReportCopyWith<$Res> {
  _$BusinessDebtReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? businessDebt = null,
    Object? totalDebts = null,
    Object? lastDaysFor = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      businessDebt: null == businessDebt
          ? _value.businessDebt
          : businessDebt // ignore: cast_nullable_to_non_nullable
              as List<BusinessDebt>,
      totalDebts: null == totalDebts
          ? _value.totalDebts
          : totalDebts // ignore: cast_nullable_to_non_nullable
              as int,
      lastDaysFor: null == lastDaysFor
          ? _value.lastDaysFor
          : lastDaysFor // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusinessDebtReportImplCopyWith<$Res>
    implements $BusinessDebtReportCopyWith<$Res> {
  factory _$$BusinessDebtReportImplCopyWith(_$BusinessDebtReportImpl value,
          $Res Function(_$BusinessDebtReportImpl) then) =
      __$$BusinessDebtReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      List<BusinessDebt> businessDebt,
      int totalDebts,
      int lastDaysFor});
}

/// @nodoc
class __$$BusinessDebtReportImplCopyWithImpl<$Res>
    extends _$BusinessDebtReportCopyWithImpl<$Res, _$BusinessDebtReportImpl>
    implements _$$BusinessDebtReportImplCopyWith<$Res> {
  __$$BusinessDebtReportImplCopyWithImpl(_$BusinessDebtReportImpl _value,
      $Res Function(_$BusinessDebtReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? businessDebt = null,
    Object? totalDebts = null,
    Object? lastDaysFor = null,
  }) {
    return _then(_$BusinessDebtReportImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      businessDebt: null == businessDebt
          ? _value._businessDebt
          : businessDebt // ignore: cast_nullable_to_non_nullable
              as List<BusinessDebt>,
      totalDebts: null == totalDebts
          ? _value.totalDebts
          : totalDebts // ignore: cast_nullable_to_non_nullable
              as int,
      lastDaysFor: null == lastDaysFor
          ? _value.lastDaysFor
          : lastDaysFor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BusinessDebtReportImpl implements _BusinessDebtReport {
  const _$BusinessDebtReportImpl(
      {required this.date,
      required final List<BusinessDebt> businessDebt,
      required this.totalDebts,
      required this.lastDaysFor})
      : _businessDebt = businessDebt;

  @override
  final String date;
  final List<BusinessDebt> _businessDebt;
  @override
  List<BusinessDebt> get businessDebt {
    if (_businessDebt is EqualUnmodifiableListView) return _businessDebt;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_businessDebt);
  }

  @override
  final int totalDebts;
  @override
  final int lastDaysFor;

  @override
  String toString() {
    return 'BusinessDebtReport(date: $date, businessDebt: $businessDebt, totalDebts: $totalDebts, lastDaysFor: $lastDaysFor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessDebtReportImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._businessDebt, _businessDebt) &&
            (identical(other.totalDebts, totalDebts) ||
                other.totalDebts == totalDebts) &&
            (identical(other.lastDaysFor, lastDaysFor) ||
                other.lastDaysFor == lastDaysFor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      const DeepCollectionEquality().hash(_businessDebt),
      totalDebts,
      lastDaysFor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessDebtReportImplCopyWith<_$BusinessDebtReportImpl> get copyWith =>
      __$$BusinessDebtReportImplCopyWithImpl<_$BusinessDebtReportImpl>(
          this, _$identity);
}

abstract class _BusinessDebtReport implements BusinessDebtReport {
  const factory _BusinessDebtReport(
      {required final String date,
      required final List<BusinessDebt> businessDebt,
      required final int totalDebts,
      required final int lastDaysFor}) = _$BusinessDebtReportImpl;

  @override
  String get date;
  @override
  List<BusinessDebt> get businessDebt;
  @override
  int get totalDebts;
  @override
  int get lastDaysFor;
  @override
  @JsonKey(ignore: true)
  _$$BusinessDebtReportImplCopyWith<_$BusinessDebtReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
