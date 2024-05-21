// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_debt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PersonalDebt {
  String get id => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get whom => throw _privateConstructorUsedError;
  bool get isGet => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersonalDebtCopyWith<PersonalDebt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalDebtCopyWith<$Res> {
  factory $PersonalDebtCopyWith(
          PersonalDebt value, $Res Function(PersonalDebt) then) =
      _$PersonalDebtCopyWithImpl<$Res, PersonalDebt>;
  @useResult
  $Res call(
      {String id,
      String details,
      int amount,
      String whom,
      bool isGet,
      String date});
}

/// @nodoc
class _$PersonalDebtCopyWithImpl<$Res, $Val extends PersonalDebt>
    implements $PersonalDebtCopyWith<$Res> {
  _$PersonalDebtCopyWithImpl(this._value, this._then);

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
    Object? whom = null,
    Object? isGet = null,
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
      whom: null == whom
          ? _value.whom
          : whom // ignore: cast_nullable_to_non_nullable
              as String,
      isGet: null == isGet
          ? _value.isGet
          : isGet // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalDebtImplCopyWith<$Res>
    implements $PersonalDebtCopyWith<$Res> {
  factory _$$PersonalDebtImplCopyWith(
          _$PersonalDebtImpl value, $Res Function(_$PersonalDebtImpl) then) =
      __$$PersonalDebtImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String details,
      int amount,
      String whom,
      bool isGet,
      String date});
}

/// @nodoc
class __$$PersonalDebtImplCopyWithImpl<$Res>
    extends _$PersonalDebtCopyWithImpl<$Res, _$PersonalDebtImpl>
    implements _$$PersonalDebtImplCopyWith<$Res> {
  __$$PersonalDebtImplCopyWithImpl(
      _$PersonalDebtImpl _value, $Res Function(_$PersonalDebtImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? details = null,
    Object? amount = null,
    Object? whom = null,
    Object? isGet = null,
    Object? date = null,
  }) {
    return _then(_$PersonalDebtImpl(
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
      whom: null == whom
          ? _value.whom
          : whom // ignore: cast_nullable_to_non_nullable
              as String,
      isGet: null == isGet
          ? _value.isGet
          : isGet // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PersonalDebtImpl implements _PersonalDebt {
  const _$PersonalDebtImpl(
      {required this.id,
      required this.details,
      required this.amount,
      required this.whom,
      required this.isGet,
      required this.date});

  @override
  final String id;
  @override
  final String details;
  @override
  final int amount;
  @override
  final String whom;
  @override
  final bool isGet;
  @override
  final String date;

  @override
  String toString() {
    return 'PersonalDebt(id: $id, details: $details, amount: $amount, whom: $whom, isGet: $isGet, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalDebtImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.whom, whom) || other.whom == whom) &&
            (identical(other.isGet, isGet) || other.isGet == isGet) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, details, amount, whom, isGet, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalDebtImplCopyWith<_$PersonalDebtImpl> get copyWith =>
      __$$PersonalDebtImplCopyWithImpl<_$PersonalDebtImpl>(this, _$identity);
}

abstract class _PersonalDebt implements PersonalDebt {
  const factory _PersonalDebt(
      {required final String id,
      required final String details,
      required final int amount,
      required final String whom,
      required final bool isGet,
      required final String date}) = _$PersonalDebtImpl;

  @override
  String get id;
  @override
  String get details;
  @override
  int get amount;
  @override
  String get whom;
  @override
  bool get isGet;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$PersonalDebtImplCopyWith<_$PersonalDebtImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
