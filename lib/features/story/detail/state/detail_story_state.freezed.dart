// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_story_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailStoryState {
  bool get isLoading => throw _privateConstructorUsedError;
  StoryDetailResponseModel? get model => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailStoryStateCopyWith<DetailStoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStoryStateCopyWith<$Res> {
  factory $DetailStoryStateCopyWith(
          DetailStoryState value, $Res Function(DetailStoryState) then) =
      _$DetailStoryStateCopyWithImpl<$Res, DetailStoryState>;
  @useResult
  $Res call({bool isLoading, StoryDetailResponseModel? model});
}

/// @nodoc
class _$DetailStoryStateCopyWithImpl<$Res, $Val extends DetailStoryState>
    implements $DetailStoryStateCopyWith<$Res> {
  _$DetailStoryStateCopyWithImpl(this._value, this._then);

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
              as StoryDetailResponseModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetailStoryStateCopyWith<$Res>
    implements $DetailStoryStateCopyWith<$Res> {
  factory _$$_DetailStoryStateCopyWith(
          _$_DetailStoryState value, $Res Function(_$_DetailStoryState) then) =
      __$$_DetailStoryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, StoryDetailResponseModel? model});
}

/// @nodoc
class __$$_DetailStoryStateCopyWithImpl<$Res>
    extends _$DetailStoryStateCopyWithImpl<$Res, _$_DetailStoryState>
    implements _$$_DetailStoryStateCopyWith<$Res> {
  __$$_DetailStoryStateCopyWithImpl(
      _$_DetailStoryState _value, $Res Function(_$_DetailStoryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? model = freezed,
  }) {
    return _then(_$_DetailStoryState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as StoryDetailResponseModel?,
    ));
  }
}

/// @nodoc

class _$_DetailStoryState extends _DetailStoryState {
  const _$_DetailStoryState({this.isLoading = false, this.model}) : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final StoryDetailResponseModel? model;

  @override
  String toString() {
    return 'DetailStoryState(isLoading: $isLoading, model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailStoryState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailStoryStateCopyWith<_$_DetailStoryState> get copyWith =>
      __$$_DetailStoryStateCopyWithImpl<_$_DetailStoryState>(this, _$identity);
}

abstract class _DetailStoryState extends DetailStoryState {
  const factory _DetailStoryState(
      {final bool isLoading,
      final StoryDetailResponseModel? model}) = _$_DetailStoryState;
  const _DetailStoryState._() : super._();

  @override
  bool get isLoading;
  @override
  StoryDetailResponseModel? get model;
  @override
  @JsonKey(ignore: true)
  _$$_DetailStoryStateCopyWith<_$_DetailStoryState> get copyWith =>
      throw _privateConstructorUsedError;
}
