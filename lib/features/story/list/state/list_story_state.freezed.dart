// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_story_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListStoryState {
  bool get isLoading => throw _privateConstructorUsedError;
  int? get currentPage => throw _privateConstructorUsedError;
  StoryGetAllResponseModel? get model => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListStoryStateCopyWith<ListStoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListStoryStateCopyWith<$Res> {
  factory $ListStoryStateCopyWith(
          ListStoryState value, $Res Function(ListStoryState) then) =
      _$ListStoryStateCopyWithImpl<$Res, ListStoryState>;
  @useResult
  $Res call(
      {bool isLoading, int? currentPage, StoryGetAllResponseModel? model});

  $StoryGetAllResponseModelCopyWith<$Res>? get model;
}

/// @nodoc
class _$ListStoryStateCopyWithImpl<$Res, $Val extends ListStoryState>
    implements $ListStoryStateCopyWith<$Res> {
  _$ListStoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currentPage = freezed,
    Object? model = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as StoryGetAllResponseModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoryGetAllResponseModelCopyWith<$Res>? get model {
    if (_value.model == null) {
      return null;
    }

    return $StoryGetAllResponseModelCopyWith<$Res>(_value.model!, (value) {
      return _then(_value.copyWith(model: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ListStoryStateCopyWith<$Res>
    implements $ListStoryStateCopyWith<$Res> {
  factory _$$_ListStoryStateCopyWith(
          _$_ListStoryState value, $Res Function(_$_ListStoryState) then) =
      __$$_ListStoryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, int? currentPage, StoryGetAllResponseModel? model});

  @override
  $StoryGetAllResponseModelCopyWith<$Res>? get model;
}

/// @nodoc
class __$$_ListStoryStateCopyWithImpl<$Res>
    extends _$ListStoryStateCopyWithImpl<$Res, _$_ListStoryState>
    implements _$$_ListStoryStateCopyWith<$Res> {
  __$$_ListStoryStateCopyWithImpl(
      _$_ListStoryState _value, $Res Function(_$_ListStoryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currentPage = freezed,
    Object? model = freezed,
  }) {
    return _then(_$_ListStoryState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as StoryGetAllResponseModel?,
    ));
  }
}

/// @nodoc

class _$_ListStoryState extends _ListStoryState {
  const _$_ListStoryState(
      {this.isLoading = false, this.currentPage = 1, this.model})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final int? currentPage;
  @override
  final StoryGetAllResponseModel? model;

  @override
  String toString() {
    return 'ListStoryState(isLoading: $isLoading, currentPage: $currentPage, model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListStoryState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, currentPage, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListStoryStateCopyWith<_$_ListStoryState> get copyWith =>
      __$$_ListStoryStateCopyWithImpl<_$_ListStoryState>(this, _$identity);
}

abstract class _ListStoryState extends ListStoryState {
  const factory _ListStoryState(
      {final bool isLoading,
      final int? currentPage,
      final StoryGetAllResponseModel? model}) = _$_ListStoryState;
  const _ListStoryState._() : super._();

  @override
  bool get isLoading;
  @override
  int? get currentPage;
  @override
  StoryGetAllResponseModel? get model;
  @override
  @JsonKey(ignore: true)
  _$$_ListStoryStateCopyWith<_$_ListStoryState> get copyWith =>
      throw _privateConstructorUsedError;
}
