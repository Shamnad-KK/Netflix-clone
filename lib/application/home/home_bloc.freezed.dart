// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeScreenData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeScreenData value) getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetHomeScreenData value)? getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeScreenData value)? getHomeScreenData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res> implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  final HomeEvent _value;
  // ignore: unused_field
  final $Res Function(HomeEvent) _then;
}

/// @nodoc
abstract class _$$GetHomeScreenDataCopyWith<$Res> {
  factory _$$GetHomeScreenDataCopyWith(
          _$GetHomeScreenData value, $Res Function(_$GetHomeScreenData) then) =
      __$$GetHomeScreenDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetHomeScreenDataCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res>
    implements _$$GetHomeScreenDataCopyWith<$Res> {
  __$$GetHomeScreenDataCopyWithImpl(
      _$GetHomeScreenData _value, $Res Function(_$GetHomeScreenData) _then)
      : super(_value, (v) => _then(v as _$GetHomeScreenData));

  @override
  _$GetHomeScreenData get _value => super._value as _$GetHomeScreenData;
}

/// @nodoc

class _$GetHomeScreenData implements GetHomeScreenData {
  const _$GetHomeScreenData();

  @override
  String toString() {
    return 'HomeEvent.getHomeScreenData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetHomeScreenData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeScreenData,
  }) {
    return getHomeScreenData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getHomeScreenData,
  }) {
    return getHomeScreenData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeScreenData,
    required TResult orElse(),
  }) {
    if (getHomeScreenData != null) {
      return getHomeScreenData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeScreenData value) getHomeScreenData,
  }) {
    return getHomeScreenData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetHomeScreenData value)? getHomeScreenData,
  }) {
    return getHomeScreenData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeScreenData value)? getHomeScreenData,
    required TResult orElse(),
  }) {
    if (getHomeScreenData != null) {
      return getHomeScreenData(this);
    }
    return orElse();
  }
}

abstract class GetHomeScreenData implements HomeEvent {
  const factory GetHomeScreenData() = _$GetHomeScreenData;
}

/// @nodoc
mixin _$HomeState {
  String get id => throw _privateConstructorUsedError;
  List<NewAndHotResult> get pastYearMovieList =>
      throw _privateConstructorUsedError;
  List<NewAndHotResult> get trendingNowMovieList =>
      throw _privateConstructorUsedError;
  List<NewAndHotResult> get southIndianMovieList =>
      throw _privateConstructorUsedError;
  List<NewAndHotResult> get tenseDramasTvList =>
      throw _privateConstructorUsedError;
  List<NewAndHotResult> get trendingNowTvList =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {String id,
      List<NewAndHotResult> pastYearMovieList,
      List<NewAndHotResult> trendingNowMovieList,
      List<NewAndHotResult> southIndianMovieList,
      List<NewAndHotResult> tenseDramasTvList,
      List<NewAndHotResult> trendingNowTvList,
      bool isLoading,
      bool isError});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? pastYearMovieList = freezed,
    Object? trendingNowMovieList = freezed,
    Object? southIndianMovieList = freezed,
    Object? tenseDramasTvList = freezed,
    Object? trendingNowTvList = freezed,
    Object? isLoading = freezed,
    Object? isError = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pastYearMovieList: pastYearMovieList == freezed
          ? _value.pastYearMovieList
          : pastYearMovieList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotResult>,
      trendingNowMovieList: trendingNowMovieList == freezed
          ? _value.trendingNowMovieList
          : trendingNowMovieList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotResult>,
      southIndianMovieList: southIndianMovieList == freezed
          ? _value.southIndianMovieList
          : southIndianMovieList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotResult>,
      tenseDramasTvList: tenseDramasTvList == freezed
          ? _value.tenseDramasTvList
          : tenseDramasTvList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotResult>,
      trendingNowTvList: trendingNowTvList == freezed
          ? _value.trendingNowTvList
          : trendingNowTvList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotResult>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      List<NewAndHotResult> pastYearMovieList,
      List<NewAndHotResult> trendingNowMovieList,
      List<NewAndHotResult> southIndianMovieList,
      List<NewAndHotResult> tenseDramasTvList,
      List<NewAndHotResult> trendingNowTvList,
      bool isLoading,
      bool isError});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? id = freezed,
    Object? pastYearMovieList = freezed,
    Object? trendingNowMovieList = freezed,
    Object? southIndianMovieList = freezed,
    Object? tenseDramasTvList = freezed,
    Object? trendingNowTvList = freezed,
    Object? isLoading = freezed,
    Object? isError = freezed,
  }) {
    return _then(_$_Initial(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pastYearMovieList: pastYearMovieList == freezed
          ? _value._pastYearMovieList
          : pastYearMovieList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotResult>,
      trendingNowMovieList: trendingNowMovieList == freezed
          ? _value._trendingNowMovieList
          : trendingNowMovieList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotResult>,
      southIndianMovieList: southIndianMovieList == freezed
          ? _value._southIndianMovieList
          : southIndianMovieList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotResult>,
      tenseDramasTvList: tenseDramasTvList == freezed
          ? _value._tenseDramasTvList
          : tenseDramasTvList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotResult>,
      trendingNowTvList: trendingNowTvList == freezed
          ? _value._trendingNowTvList
          : trendingNowTvList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotResult>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.id,
      required final List<NewAndHotResult> pastYearMovieList,
      required final List<NewAndHotResult> trendingNowMovieList,
      required final List<NewAndHotResult> southIndianMovieList,
      required final List<NewAndHotResult> tenseDramasTvList,
      required final List<NewAndHotResult> trendingNowTvList,
      required this.isLoading,
      required this.isError})
      : _pastYearMovieList = pastYearMovieList,
        _trendingNowMovieList = trendingNowMovieList,
        _southIndianMovieList = southIndianMovieList,
        _tenseDramasTvList = tenseDramasTvList,
        _trendingNowTvList = trendingNowTvList;

  @override
  final String id;
  final List<NewAndHotResult> _pastYearMovieList;
  @override
  List<NewAndHotResult> get pastYearMovieList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pastYearMovieList);
  }

  final List<NewAndHotResult> _trendingNowMovieList;
  @override
  List<NewAndHotResult> get trendingNowMovieList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingNowMovieList);
  }

  final List<NewAndHotResult> _southIndianMovieList;
  @override
  List<NewAndHotResult> get southIndianMovieList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_southIndianMovieList);
  }

  final List<NewAndHotResult> _tenseDramasTvList;
  @override
  List<NewAndHotResult> get tenseDramasTvList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tenseDramasTvList);
  }

  final List<NewAndHotResult> _trendingNowTvList;
  @override
  List<NewAndHotResult> get trendingNowTvList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingNowTvList);
  }

  @override
  final bool isLoading;
  @override
  final bool isError;

  @override
  String toString() {
    return 'HomeState(id: $id, pastYearMovieList: $pastYearMovieList, trendingNowMovieList: $trendingNowMovieList, southIndianMovieList: $southIndianMovieList, tenseDramasTvList: $tenseDramasTvList, trendingNowTvList: $trendingNowTvList, isLoading: $isLoading, isError: $isError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other._pastYearMovieList, _pastYearMovieList) &&
            const DeepCollectionEquality()
                .equals(other._trendingNowMovieList, _trendingNowMovieList) &&
            const DeepCollectionEquality()
                .equals(other._southIndianMovieList, _southIndianMovieList) &&
            const DeepCollectionEquality()
                .equals(other._tenseDramasTvList, _tenseDramasTvList) &&
            const DeepCollectionEquality()
                .equals(other._trendingNowTvList, _trendingNowTvList) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isError, isError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(_pastYearMovieList),
      const DeepCollectionEquality().hash(_trendingNowMovieList),
      const DeepCollectionEquality().hash(_southIndianMovieList),
      const DeepCollectionEquality().hash(_tenseDramasTvList),
      const DeepCollectionEquality().hash(_trendingNowTvList),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isError));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements HomeState {
  const factory _Initial(
      {required final String id,
      required final List<NewAndHotResult> pastYearMovieList,
      required final List<NewAndHotResult> trendingNowMovieList,
      required final List<NewAndHotResult> southIndianMovieList,
      required final List<NewAndHotResult> tenseDramasTvList,
      required final List<NewAndHotResult> trendingNowTvList,
      required final bool isLoading,
      required final bool isError}) = _$_Initial;

  @override
  String get id;
  @override
  List<NewAndHotResult> get pastYearMovieList;
  @override
  List<NewAndHotResult> get trendingNowMovieList;
  @override
  List<NewAndHotResult> get southIndianMovieList;
  @override
  List<NewAndHotResult> get tenseDramasTvList;
  @override
  List<NewAndHotResult> get trendingNowTvList;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
