// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_expense_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BusinessExpenseReport {
  String get date => throw _privateConstructorUsedError;
  List<BusinessExpense> get businessExpenses =>
      throw _privateConstructorUsedError;
  int get totalExpenses => throw _privateConstructorUsedError;
  int get lastDaysFor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BusinessExpenseReportCopyWith<BusinessExpenseReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessExpenseReportCopyWith<$Res> {
  factory $BusinessExpenseReportCopyWith(BusinessExpenseReport value,
          $Res Function(BusinessExpenseReport) then) =
      _$BusinessExpenseReportCopyWithImpl<$Res, BusinessExpenseReport>;
  @useResult
  $Res call(
      {String date,
      List<BusinessExpense> businessExpenses,
      int totalExpenses,
      int lastDaysFor});
}

/// @nodoc
class _$BusinessExpenseReportCopyWithImpl<$Res,
        $Val extends BusinessExpenseReport>
    implements $BusinessExpenseReportCopyWith<$Res> {
  _$BusinessExpenseReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? businessExpenses = null,
    Object? totalExpenses = null,
    Object? lastDaysFor = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      businessExpenses: null == businessExpenses
          ? _value.businessExpenses
          : businessExpenses // ignore: cast_nullable_to_non_nullable
              as List<BusinessExpense>,
      totalExpenses: null == totalExpenses
          ? _value.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
              as int,
      lastDaysFor: null == lastDaysFor
          ? _value.lastDaysFor
          : lastDaysFor // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusinessExpenseReportImplCopyWith<$Res>
    implements $BusinessExpenseReportCopyWith<$Res> {
  factory _$$BusinessExpenseReportImplCopyWith(
          _$BusinessExpenseReportImpl value,
          $Res Function(_$BusinessExpenseReportImpl) then) =
      __$$BusinessExpenseReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      List<BusinessExpense> businessExpenses,
      int totalExpenses,
      int lastDaysFor});
}

/// @nodoc
class __$$BusinessExpenseReportImplCopyWithImpl<$Res>
    extends _$BusinessExpenseReportCopyWithImpl<$Res,
        _$BusinessExpenseReportImpl>
    implements _$$BusinessExpenseReportImplCopyWith<$Res> {
  __$$BusinessExpenseReportImplCopyWithImpl(_$BusinessExpenseReportImpl _value,
      $Res Function(_$BusinessExpenseReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? businessExpenses = null,
    Object? totalExpenses = null,
    Object? lastDaysFor = null,
  }) {
    return _then(_$BusinessExpenseReportImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      businessExpenses: null == businessExpenses
          ? _value._businessExpenses
          : businessExpenses // ignore: cast_nullable_to_non_nullable
              as List<BusinessExpense>,
      totalExpenses: null == totalExpenses
          ? _value.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
              as int,
      lastDaysFor: null == lastDaysFor
          ? _value.lastDaysFor
          : lastDaysFor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BusinessExpenseReportImpl implements _BusinessExpenseReport {
  const _$BusinessExpenseReportImpl(
      {required this.date,
      required final List<BusinessExpense> businessExpenses,
      required this.totalExpenses,
      required this.lastDaysFor})
      : _businessExpenses = businessExpenses;

  @override
  final String date;
  final List<BusinessExpense> _businessExpenses;
  @override
  List<BusinessExpense> get businessExpenses {
    if (_businessExpenses is EqualUnmodifiableListView)
      return _businessExpenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_businessExpenses);
  }

  @override
  final int totalExpenses;
  @override
  final int lastDaysFor;

  @override
  String toString() {
    return 'BusinessExpenseReport(date: $date, businessExpenses: $businessExpenses, totalExpenses: $totalExpenses, lastDaysFor: $lastDaysFor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessExpenseReportImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._businessExpenses, _businessExpenses) &&
            (identical(other.totalExpenses, totalExpenses) ||
                other.totalExpenses == totalExpenses) &&
            (identical(other.lastDaysFor, lastDaysFor) ||
                other.lastDaysFor == lastDaysFor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      const DeepCollectionEquality().hash(_businessExpenses),
      totalExpenses,
      lastDaysFor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessExpenseReportImplCopyWith<_$BusinessExpenseReportImpl>
      get copyWith => __$$BusinessExpenseReportImplCopyWithImpl<
          _$BusinessExpenseReportImpl>(this, _$identity);
}

abstract class _BusinessExpenseReport implements BusinessExpenseReport {
  const factory _BusinessExpenseReport(
      {required final String date,
      required final List<BusinessExpense> businessExpenses,
      required final int totalExpenses,
      required final int lastDaysFor}) = _$BusinessExpenseReportImpl;

  @override
  String get date;
  @override
  List<BusinessExpense> get businessExpenses;
  @override
  int get totalExpenses;
  @override
  int get lastDaysFor;
  @override
  @JsonKey(ignore: true)
  _$$BusinessExpenseReportImplCopyWith<_$BusinessExpenseReportImpl>
      get copyWith => throw _privateConstructorUsedError;
}
