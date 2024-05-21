// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_expense.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PersonalExpense {
  String get id => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersonalExpenseCopyWith<PersonalExpense> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalExpenseCopyWith<$Res> {
  factory $PersonalExpenseCopyWith(
          PersonalExpense value, $Res Function(PersonalExpense) then) =
      _$PersonalExpenseCopyWithImpl<$Res, PersonalExpense>;
  @useResult
  $Res call({String id, String details, int amount, String date});
}

/// @nodoc
class _$PersonalExpenseCopyWithImpl<$Res, $Val extends PersonalExpense>
    implements $PersonalExpenseCopyWith<$Res> {
  _$PersonalExpenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? details = null,
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalExpenseImplCopyWith<$Res>
    implements $PersonalExpenseCopyWith<$Res> {
  factory _$$PersonalExpenseImplCopyWith(_$PersonalExpenseImpl value,
          $Res Function(_$PersonalExpenseImpl) then) =
      __$$PersonalExpenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String details, int amount, String date});
}

/// @nodoc
class __$$PersonalExpenseImplCopyWithImpl<$Res>
    extends _$PersonalExpenseCopyWithImpl<$Res, _$PersonalExpenseImpl>
    implements _$$PersonalExpenseImplCopyWith<$Res> {
  __$$PersonalExpenseImplCopyWithImpl(
      _$PersonalExpenseImpl _value, $Res Function(_$PersonalExpenseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? details = null,
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_$PersonalExpenseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PersonalExpenseImpl implements _PersonalExpense {
  const _$PersonalExpenseImpl(
      {required this.id,
      required this.details,
      required this.amount,
      required this.date});

  @override
  final String id;
  @override
  final String details;
  @override
  final int amount;
  @override
  final String date;

  @override
  String toString() {
    return 'PersonalExpense(id: $id, details: $details, amount: $amount, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalExpenseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, details, amount, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalExpenseImplCopyWith<_$PersonalExpenseImpl> get copyWith =>
      __$$PersonalExpenseImplCopyWithImpl<_$PersonalExpenseImpl>(
          this, _$identity);
}

abstract class _PersonalExpense implements PersonalExpense {
  const factory _PersonalExpense(
      {required final String id,
      required final String details,
      required final int amount,
      required final String date}) = _$PersonalExpenseImpl;

  @override
  String get id;
  @override
  String get details;
  @override
  int get amount;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$PersonalExpenseImplCopyWith<_$PersonalExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
