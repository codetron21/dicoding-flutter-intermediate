// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginFormState {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get messageEmailError => throw _privateConstructorUsedError;
  String get messagePasswordError => throw _privateConstructorUsedError;
  bool get isPasswordVisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginFormStateCopyWith<LoginFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFormStateCopyWith<$Res> {
  factory $LoginFormStateCopyWith(
          LoginFormState value, $Res Function(LoginFormState) then) =
      _$LoginFormStateCopyWithImpl<$Res, LoginFormState>;
  @useResult
  $Res call(
      {String email,
      String password,
      String messageEmailError,
      String messagePasswordError,
      bool isPasswordVisible});
}

/// @nodoc
class _$LoginFormStateCopyWithImpl<$Res, $Val extends LoginFormState>
    implements $LoginFormStateCopyWith<$Res> {
  _$LoginFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? messageEmailError = null,
    Object? messagePasswordError = null,
    Object? isPasswordVisible = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      messageEmailError: null == messageEmailError
          ? _value.messageEmailError
          : messageEmailError // ignore: cast_nullable_to_non_nullable
              as String,
      messagePasswordError: null == messagePasswordError
          ? _value.messagePasswordError
          : messagePasswordError // ignore: cast_nullable_to_non_nullable
              as String,
      isPasswordVisible: null == isPasswordVisible
          ? _value.isPasswordVisible
          : isPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginFormStateCopyWith<$Res>
    implements $LoginFormStateCopyWith<$Res> {
  factory _$$_LoginFormStateCopyWith(
          _$_LoginFormState value, $Res Function(_$_LoginFormState) then) =
      __$$_LoginFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      String messageEmailError,
      String messagePasswordError,
      bool isPasswordVisible});
}

/// @nodoc
class __$$_LoginFormStateCopyWithImpl<$Res>
    extends _$LoginFormStateCopyWithImpl<$Res, _$_LoginFormState>
    implements _$$_LoginFormStateCopyWith<$Res> {
  __$$_LoginFormStateCopyWithImpl(
      _$_LoginFormState _value, $Res Function(_$_LoginFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? messageEmailError = null,
    Object? messagePasswordError = null,
    Object? isPasswordVisible = null,
  }) {
    return _then(_$_LoginFormState(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      messageEmailError: null == messageEmailError
          ? _value.messageEmailError
          : messageEmailError // ignore: cast_nullable_to_non_nullable
              as String,
      messagePasswordError: null == messagePasswordError
          ? _value.messagePasswordError
          : messagePasswordError // ignore: cast_nullable_to_non_nullable
              as String,
      isPasswordVisible: null == isPasswordVisible
          ? _value.isPasswordVisible
          : isPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoginFormState extends _LoginFormState {
  const _$_LoginFormState(
      {this.email = '',
      this.password = '',
      this.messageEmailError = '',
      this.messagePasswordError = '',
      this.isPasswordVisible = false})
      : super._();

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String messageEmailError;
  @override
  @JsonKey()
  final String messagePasswordError;
  @override
  @JsonKey()
  final bool isPasswordVisible;

  @override
  String toString() {
    return 'LoginFormState(email: $email, password: $password, messageEmailError: $messageEmailError, messagePasswordError: $messagePasswordError, isPasswordVisible: $isPasswordVisible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginFormState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.messageEmailError, messageEmailError) ||
                other.messageEmailError == messageEmailError) &&
            (identical(other.messagePasswordError, messagePasswordError) ||
                other.messagePasswordError == messagePasswordError) &&
            (identical(other.isPasswordVisible, isPasswordVisible) ||
                other.isPasswordVisible == isPasswordVisible));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password,
      messageEmailError, messagePasswordError, isPasswordVisible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginFormStateCopyWith<_$_LoginFormState> get copyWith =>
      __$$_LoginFormStateCopyWithImpl<_$_LoginFormState>(this, _$identity);
}

abstract class _LoginFormState extends LoginFormState {
  const factory _LoginFormState(
      {final String email,
      final String password,
      final String messageEmailError,
      final String messagePasswordError,
      final bool isPasswordVisible}) = _$_LoginFormState;
  const _LoginFormState._() : super._();

  @override
  String get email;
  @override
  String get password;
  @override
  String get messageEmailError;
  @override
  String get messagePasswordError;
  @override
  bool get isPasswordVisible;
  @override
  @JsonKey(ignore: true)
  _$$_LoginFormStateCopyWith<_$_LoginFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
