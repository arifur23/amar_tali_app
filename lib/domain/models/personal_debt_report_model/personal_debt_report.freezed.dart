// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_debt_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PersonalDebtReport {
  String get date => throw _privateConstructorUsedError;
  List<PersonalDebt> get personalDebt => throw _privateConstructorUsedError;
  int get totalDebts => throw _privateConstructorUsedError;
  int get lastDaysFor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersonalDebtReportCopyWith<PersonalDebtReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalDebtReportCopyWith<$Res> {
  factory $PersonalDebtReportCopyWith(
          PersonalDebtReport value, $Res Function(PersonalDebtReport) then) =
      _$PersonalDebtReportCopyWithImpl<$Res, PersonalDebtReport>;
  @useResult
  $Res call(
      {String date,
      List<PersonalDebt> personalDebt,
      int totalDebts,
      int lastDaysFor});
}

/// @nodoc
class _$PersonalDebtReportCopyWithImpl<$Res, $Val extends PersonalDebtReport>
    implements $PersonalDebtReportCopyWith<$Res> {
  _$PersonalDebtReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? personalDebt = null,
    Object? totalDebts = null,
    Object? lastDaysFor = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      personalDebt: null == personalDebt
          ? _value.personalDebt
          : personalDebt // ignore: cast_nullable_to_non_nullable
              as List<PersonalDebt>,
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
abstract class _$$PersonalDebtReportImplCopyWith<$Res>
    implements $PersonalDebtReportCopyWith<$Res> {
  factory _$$PersonalDebtReportImplCopyWith(_$PersonalDebtReportImpl value,
          $Res Function(_$PersonalDebtReportImpl) then) =
      __$$PersonalDebtReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      List<PersonalDebt> personalDebt,
      int totalDebts,
      int lastDaysFor});
}

/// @nodoc
class __$$PersonalDebtReportImplCopyWithImpl<$Res>
    extends _$PersonalDebtReportCopyWithImpl<$Res, _$PersonalDebtReportImpl>
    implements _$$PersonalDebtReportImplCopyWith<$Res> {
  __$$PersonalDebtReportImplCopyWithImpl(_$PersonalDebtReportImpl _value,
      $Res Function(_$PersonalDebtReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? personalDebt = null,
    Object? totalDebts = null,
    Object? lastDaysFor = null,
  }) {
    return _then(_$PersonalDebtReportImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      personalDebt: null == personalDebt
          ? _value._personalDebt
          : personalDebt // ignore: cast_nullable_to_non_nullable
              as List<PersonalDebt>,
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

class _$PersonalDebtReportImpl implements _PersonalDebtReport {
  const _$PersonalDebtReportImpl(
      {required this.date,
      required final List<PersonalDebt> personalDebt,
      required this.totalDebts,
      required this.lastDaysFor})
      : _personalDebt = personalDebt;

  @override
  final String date;
  final List<PersonalDebt> _personalDebt;
  @override
  List<PersonalDebt> get personalDebt {
    if (_personalDebt is EqualUnmodifiableListView) return _personalDebt;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_personalDebt);
  }

  @override
  final int totalDebts;
  @override
  final int lastDaysFor;

  @override
  String toString() {
    return 'PersonalDebtReport(date: $date, personalDebt: $personalDebt, totalDebts: $totalDebts, lastDaysFor: $lastDaysFor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalDebtReportImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._personalDebt, _personalDebt) &&
            (identical(other.totalDebts, totalDebts) ||
                other.totalDebts == totalDebts) &&
            (identical(other.lastDaysFor, lastDaysFor) ||
                other.lastDaysFor == lastDaysFor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      const DeepCollectionEquality().hash(_personalDebt),
      totalDebts,
      lastDaysFor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalDebtReportImplCopyWith<_$PersonalDebtReportImpl> get copyWith =>
      __$$PersonalDebtReportImplCopyWithImpl<_$PersonalDebtReportImpl>(
          this, _$identity);
}

abstract class _PersonalDebtReport implements PersonalDebtReport {
  const factory _PersonalDebtReport(
      {required final String date,
      required final List<PersonalDebt> personalDebt,
      required final int totalDebts,
      required final int lastDaysFor}) = _$PersonalDebtReportImpl;

  @override
  String get date;
  @override
  List<PersonalDebt> get personalDebt;
  @override
  int get totalDebts;
  @override
  int get lastDaysFor;
  @override
  @JsonKey(ignore: true)
  _$$PersonalDebtReportImplCopyWith<_$PersonalDebtReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
