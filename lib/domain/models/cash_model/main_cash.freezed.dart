// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_cash.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainCash {
  String get id => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainCashCopyWith<MainCash> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainCashCopyWith<$Res> {
  factory $MainCashCopyWith(MainCash value, $Res Function(MainCash) then) =
      _$MainCashCopyWithImpl<$Res, MainCash>;
  @useResult
  $Res call({String id, int amount, String date});
}

/// @nodoc
class _$MainCashCopyWithImpl<$Res, $Val extends MainCash>
    implements $MainCashCopyWith<$Res> {
  _$MainCashCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
abstract class _$$MainCashImplCopyWith<$Res>
    implements $MainCashCopyWith<$Res> {
  factory _$$MainCashImplCopyWith(
          _$MainCashImpl value, $Res Function(_$MainCashImpl) then) =
      __$$MainCashImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int amount, String date});
}

/// @nodoc
class __$$MainCashImplCopyWithImpl<$Res>
    extends _$MainCashCopyWithImpl<$Res, _$MainCashImpl>
    implements _$$MainCashImplCopyWith<$Res> {
  __$$MainCashImplCopyWithImpl(
      _$MainCashImpl _value, $Res Function(_$MainCashImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_$MainCashImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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

class _$MainCashImpl implements _MainCash {
  const _$MainCashImpl(
      {required this.id, required this.amount, required this.date});

  @override
  final String id;
  @override
  final int amount;
  @override
  final String date;

  @override
  String toString() {
    return 'MainCash(id: $id, amount: $amount, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainCashImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, amount, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainCashImplCopyWith<_$MainCashImpl> get copyWith =>
      __$$MainCashImplCopyWithImpl<_$MainCashImpl>(this, _$identity);
}

abstract class _MainCash implements MainCash {
  const factory _MainCash(
      {required final String id,
      required final int amount,
      required final String date}) = _$MainCashImpl;

  @override
  String get id;
  @override
  int get amount;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$MainCashImplCopyWith<_$MainCashImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
