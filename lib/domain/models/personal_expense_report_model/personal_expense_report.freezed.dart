// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_expense_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PersonalExpenseReport {
  String get date => throw _privateConstructorUsedError;
  List<PersonalExpense> get personalExpense =>
      throw _privateConstructorUsedError;
  int get totalExpenses => throw _privateConstructorUsedError;
  int get lastDaysFor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersonalExpenseReportCopyWith<PersonalExpenseReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalExpenseReportCopyWith<$Res> {
  factory $PersonalExpenseReportCopyWith(PersonalExpenseReport value,
          $Res Function(PersonalExpenseReport) then) =
      _$PersonalExpenseReportCopyWithImpl<$Res, PersonalExpenseReport>;
  @useResult
  $Res call(
      {String date,
      List<PersonalExpense> personalExpense,
      int totalExpenses,
      int lastDaysFor});
}

/// @nodoc
class _$PersonalExpenseReportCopyWithImpl<$Res,
        $Val extends PersonalExpenseReport>
    implements $PersonalExpenseReportCopyWith<$Res> {
  _$PersonalExpenseReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? personalExpense = null,
    Object? totalExpenses = null,
    Object? lastDaysFor = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      personalExpense: null == personalExpense
          ? _value.personalExpense
          : personalExpense // ignore: cast_nullable_to_non_nullable
              as List<PersonalExpense>,
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
abstract class _$$PersonalExpenseReportImplCopyWith<$Res>
    implements $PersonalExpenseReportCopyWith<$Res> {
  factory _$$PersonalExpenseReportImplCopyWith(
          _$PersonalExpenseReportImpl value,
          $Res Function(_$PersonalExpenseReportImpl) then) =
      __$$PersonalExpenseReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      List<PersonalExpense> personalExpense,
      int totalExpenses,
      int lastDaysFor});
}

/// @nodoc
class __$$PersonalExpenseReportImplCopyWithImpl<$Res>
    extends _$PersonalExpenseReportCopyWithImpl<$Res,
        _$PersonalExpenseReportImpl>
    implements _$$PersonalExpenseReportImplCopyWith<$Res> {
  __$$PersonalExpenseReportImplCopyWithImpl(_$PersonalExpenseReportImpl _value,
      $Res Function(_$PersonalExpenseReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? personalExpense = null,
    Object? totalExpenses = null,
    Object? lastDaysFor = null,
  }) {
    return _then(_$PersonalExpenseReportImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      personalExpense: null == personalExpense
          ? _value._personalExpense
          : personalExpense // ignore: cast_nullable_to_non_nullable
              as List<PersonalExpense>,
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

class _$PersonalExpenseReportImpl implements _PersonalExpenseReport {
  const _$PersonalExpenseReportImpl(
      {required this.date,
      required final List<PersonalExpense> personalExpense,
      required this.totalExpenses,
      required this.lastDaysFor})
      : _personalExpense = personalExpense;

  @override
  final String date;
  final List<PersonalExpense> _personalExpense;
  @override
  List<PersonalExpense> get personalExpense {
    if (_personalExpense is EqualUnmodifiableListView) return _personalExpense;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_personalExpense);
  }

  @override
  final int totalExpenses;
  @override
  final int lastDaysFor;

  @override
  String toString() {
    return 'PersonalExpenseReport(date: $date, personalExpense: $personalExpense, totalExpenses: $totalExpenses, lastDaysFor: $lastDaysFor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalExpenseReportImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._personalExpense, _personalExpense) &&
            (identical(other.totalExpenses, totalExpenses) ||
                other.totalExpenses == totalExpenses) &&
            (identical(other.lastDaysFor, lastDaysFor) ||
                other.lastDaysFor == lastDaysFor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      const DeepCollectionEquality().hash(_personalExpense),
      totalExpenses,
      lastDaysFor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalExpenseReportImplCopyWith<_$PersonalExpenseReportImpl>
      get copyWith => __$$PersonalExpenseReportImplCopyWithImpl<
          _$PersonalExpenseReportImpl>(this, _$identity);
}

abstract class _PersonalExpenseReport implements PersonalExpenseReport {
  const factory _PersonalExpenseReport(
      {required final String date,
      required final List<PersonalExpense> personalExpense,
      required final int totalExpenses,
      required final int lastDaysFor}) = _$PersonalExpenseReportImpl;

  @override
  String get date;
  @override
  List<PersonalExpense> get personalExpense;
  @override
  int get totalExpenses;
  @override
  int get lastDaysFor;
  @override
  @JsonKey(ignore: true)
  _$$PersonalExpenseReportImplCopyWith<_$PersonalExpenseReportImpl>
      get copyWith => throw _privateConstructorUsedError;
}
