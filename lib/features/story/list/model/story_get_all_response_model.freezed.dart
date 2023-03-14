// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_get_all_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoryGetAllResponseModel _$StoryGetAllResponseModelFromJson(
    Map<String, dynamic> json) {
  return _StoryGetAllResponseModel.fromJson(json);
}

/// @nodoc
mixin _$StoryGetAllResponseModel {
  @JsonKey(name: 'error')
  bool? get error => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'listStory')
  List<StoryResponseModel>? get listStory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryGetAllResponseModelCopyWith<StoryGetAllResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryGetAllResponseModelCopyWith<$Res> {
  factory $StoryGetAllResponseModelCopyWith(StoryGetAllResponseModel value,
          $Res Function(StoryGetAllResponseModel) then) =
      _$StoryGetAllResponseModelCopyWithImpl<$Res, StoryGetAllResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'error') bool? error,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'listStory') List<StoryResponseModel>? listStory});
}

/// @nodoc
class _$StoryGetAllResponseModelCopyWithImpl<$Res,
        $Val extends StoryGetAllResponseModel>
    implements $StoryGetAllResponseModelCopyWith<$Res> {
  _$StoryGetAllResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
    Object? listStory = freezed,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      listStory: freezed == listStory
          ? _value.listStory
          : listStory // ignore: cast_nullable_to_non_nullable
              as List<StoryResponseModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoryGetAllResponseModelCopyWith<$Res>
    implements $StoryGetAllResponseModelCopyWith<$Res> {
  factory _$$_StoryGetAllResponseModelCopyWith(
          _$_StoryGetAllResponseModel value,
          $Res Function(_$_StoryGetAllResponseModel) then) =
      __$$_StoryGetAllResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'error') bool? error,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'listStory') List<StoryResponseModel>? listStory});
}

/// @nodoc
class __$$_StoryGetAllResponseModelCopyWithImpl<$Res>
    extends _$StoryGetAllResponseModelCopyWithImpl<$Res,
        _$_StoryGetAllResponseModel>
    implements _$$_StoryGetAllResponseModelCopyWith<$Res> {
  __$$_StoryGetAllResponseModelCopyWithImpl(_$_StoryGetAllResponseModel _value,
      $Res Function(_$_StoryGetAllResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
    Object? listStory = freezed,
  }) {
    return _then(_$_StoryGetAllResponseModel(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      listStory: freezed == listStory
          ? _value._listStory
          : listStory // ignore: cast_nullable_to_non_nullable
              as List<StoryResponseModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoryGetAllResponseModel extends _StoryGetAllResponseModel {
  const _$_StoryGetAllResponseModel(
      {@JsonKey(name: 'error') this.error,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'listStory') final List<StoryResponseModel>? listStory})
      : _listStory = listStory,
        super._();

  factory _$_StoryGetAllResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_StoryGetAllResponseModelFromJson(json);

  @override
  @JsonKey(name: 'error')
  final bool? error;
  @override
  @JsonKey(name: 'message')
  final String? message;
  final List<StoryResponseModel>? _listStory;
  @override
  @JsonKey(name: 'listStory')
  List<StoryResponseModel>? get listStory {
    final value = _listStory;
    if (value == null) return null;
    if (_listStory is EqualUnmodifiableListView) return _listStory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StoryGetAllResponseModel(error: $error, message: $message, listStory: $listStory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoryGetAllResponseModel &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._listStory, _listStory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message,
      const DeepCollectionEquality().hash(_listStory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoryGetAllResponseModelCopyWith<_$_StoryGetAllResponseModel>
      get copyWith => __$$_StoryGetAllResponseModelCopyWithImpl<
          _$_StoryGetAllResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoryGetAllResponseModelToJson(
      this,
    );
  }
}

abstract class _StoryGetAllResponseModel extends StoryGetAllResponseModel {
  const factory _StoryGetAllResponseModel(
          {@JsonKey(name: 'error')
              final bool? error,
          @JsonKey(name: 'message')
              final String? message,
          @JsonKey(name: 'listStory')
              final List<StoryResponseModel>? listStory}) =
      _$_StoryGetAllResponseModel;
  const _StoryGetAllResponseModel._() : super._();

  factory _StoryGetAllResponseModel.fromJson(Map<String, dynamic> json) =
      _$_StoryGetAllResponseModel.fromJson;

  @override
  @JsonKey(name: 'error')
  bool? get error;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'listStory')
  List<StoryResponseModel>? get listStory;
  @override
  @JsonKey(ignore: true)
  _$$_StoryGetAllResponseModelCopyWith<_$_StoryGetAllResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
