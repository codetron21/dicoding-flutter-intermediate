// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_story_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddStoryState {
  bool get isLoading => throw _privateConstructorUsedError;
  StoryAddResponseModel? get model => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddStoryStateCopyWith<AddStoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddStoryStateCopyWith<$Res> {
  factory $AddStoryStateCopyWith(
          AddStoryState value, $Res Function(AddStoryState) then) =
      _$AddStoryStateCopyWithImpl<$Res, AddStoryState>;
  @useResult
  $Res call({bool isLoading, StoryAddResponseModel? model});
}

/// @nodoc
class _$AddStoryStateCopyWithImpl<$Res, $Val extends AddStoryState>
    implements $AddStoryStateCopyWith<$Res> {
  _$AddStoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? model = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as StoryAddResponseModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddStoryStateCopyWith<$Res>
    implements $AddStoryStateCopyWith<$Res> {
  factory _$$_AddStoryStateCopyWith(
          _$_AddStoryState value, $Res Function(_$_AddStoryState) then) =
      __$$_AddStoryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, StoryAddResponseModel? model});
}

/// @nodoc
class __$$_AddStoryStateCopyWithImpl<$Res>
    extends _$AddStoryStateCopyWithImpl<$Res, _$_AddStoryState>
    implements _$$_AddStoryStateCopyWith<$Res> {
  __$$_AddStoryStateCopyWithImpl(
      _$_AddStoryState _value, $Res Function(_$_AddStoryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? model = freezed,
  }) {
    return _then(_$_AddStoryState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as StoryAddResponseModel?,
    ));
  }
}

/// @nodoc

class _$_AddStoryState extends _AddStoryState {
  const _$_AddStoryState({this.isLoading = false, this.model}) : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final StoryAddResponseModel? model;

  @override
  String toString() {
    return 'AddStoryState(isLoading: $isLoading, model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddStoryState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddStoryStateCopyWith<_$_AddStoryState> get copyWith =>
      __$$_AddStoryStateCopyWithImpl<_$_AddStoryState>(this, _$identity);
}

abstract class _AddStoryState extends AddStoryState {
  const factory _AddStoryState(
      {final bool isLoading,
      final StoryAddResponseModel? model}) = _$_AddStoryState;
  const _AddStoryState._() : super._();

  @override
  bool get isLoading;
  @override
  StoryAddResponseModel? get model;
  @override
  @JsonKey(ignore: true)
  _$$_AddStoryStateCopyWith<_$_AddStoryState> get copyWith =>
      throw _privateConstructorUsedError;
}
