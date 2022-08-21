// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'errand_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ErrandStateTearOff {
  const _$ErrandStateTearOff();

  _ErrandState call(
      {required bool loading,
      required bool created,
      required List<Errand> errands,
      required List<Errand> activeErrands,
      Errand? errand,
      required Failure errandsFailure,
      required Failure activeErrandsFailure}) {
    return _ErrandState(
      loading: loading,
      created: created,
      errands: errands,
      activeErrands: activeErrands,
      errand: errand,
      errandsFailure: errandsFailure,
      activeErrandsFailure: activeErrandsFailure,
    );
  }
}

/// @nodoc
const $ErrandState = _$ErrandStateTearOff();

/// @nodoc
mixin _$ErrandState {
  bool get loading => throw _privateConstructorUsedError;
  bool get created => throw _privateConstructorUsedError;
  List<Errand> get errands => throw _privateConstructorUsedError;
  List<Errand> get activeErrands => throw _privateConstructorUsedError;
  Errand? get errand => throw _privateConstructorUsedError;
  Failure get errandsFailure => throw _privateConstructorUsedError;
  Failure get activeErrandsFailure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ErrandStateCopyWith<ErrandState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrandStateCopyWith<$Res> {
  factory $ErrandStateCopyWith(
          ErrandState value, $Res Function(ErrandState) then) =
      _$ErrandStateCopyWithImpl<$Res>;
  $Res call(
      {bool loading,
      bool created,
      List<Errand> errands,
      List<Errand> activeErrands,
      Errand? errand,
      Failure errandsFailure,
      Failure activeErrandsFailure});

  $ErrandCopyWith<$Res>? get errand;
  $FailureCopyWith<$Res> get errandsFailure;
  $FailureCopyWith<$Res> get activeErrandsFailure;
}

/// @nodoc
class _$ErrandStateCopyWithImpl<$Res> implements $ErrandStateCopyWith<$Res> {
  _$ErrandStateCopyWithImpl(this._value, this._then);

  final ErrandState _value;
  // ignore: unused_field
  final $Res Function(ErrandState) _then;

  @override
  $Res call({
    Object? loading = freezed,
    Object? created = freezed,
    Object? errands = freezed,
    Object? activeErrands = freezed,
    Object? errand = freezed,
    Object? errandsFailure = freezed,
    Object? activeErrandsFailure = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as bool,
      errands: errands == freezed
          ? _value.errands
          : errands // ignore: cast_nullable_to_non_nullable
              as List<Errand>,
      activeErrands: activeErrands == freezed
          ? _value.activeErrands
          : activeErrands // ignore: cast_nullable_to_non_nullable
              as List<Errand>,
      errand: errand == freezed
          ? _value.errand
          : errand // ignore: cast_nullable_to_non_nullable
              as Errand?,
      errandsFailure: errandsFailure == freezed
          ? _value.errandsFailure
          : errandsFailure // ignore: cast_nullable_to_non_nullable
              as Failure,
      activeErrandsFailure: activeErrandsFailure == freezed
          ? _value.activeErrandsFailure
          : activeErrandsFailure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }

  @override
  $ErrandCopyWith<$Res>? get errand {
    if (_value.errand == null) {
      return null;
    }

    return $ErrandCopyWith<$Res>(_value.errand!, (value) {
      return _then(_value.copyWith(errand: value));
    });
  }

  @override
  $FailureCopyWith<$Res> get errandsFailure {
    return $FailureCopyWith<$Res>(_value.errandsFailure, (value) {
      return _then(_value.copyWith(errandsFailure: value));
    });
  }

  @override
  $FailureCopyWith<$Res> get activeErrandsFailure {
    return $FailureCopyWith<$Res>(_value.activeErrandsFailure, (value) {
      return _then(_value.copyWith(activeErrandsFailure: value));
    });
  }
}

/// @nodoc
abstract class _$ErrandStateCopyWith<$Res>
    implements $ErrandStateCopyWith<$Res> {
  factory _$ErrandStateCopyWith(
          _ErrandState value, $Res Function(_ErrandState) then) =
      __$ErrandStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool loading,
      bool created,
      List<Errand> errands,
      List<Errand> activeErrands,
      Errand? errand,
      Failure errandsFailure,
      Failure activeErrandsFailure});

  @override
  $ErrandCopyWith<$Res>? get errand;
  @override
  $FailureCopyWith<$Res> get errandsFailure;
  @override
  $FailureCopyWith<$Res> get activeErrandsFailure;
}

/// @nodoc
class __$ErrandStateCopyWithImpl<$Res> extends _$ErrandStateCopyWithImpl<$Res>
    implements _$ErrandStateCopyWith<$Res> {
  __$ErrandStateCopyWithImpl(
      _ErrandState _value, $Res Function(_ErrandState) _then)
      : super(_value, (v) => _then(v as _ErrandState));

  @override
  _ErrandState get _value => super._value as _ErrandState;

  @override
  $Res call({
    Object? loading = freezed,
    Object? created = freezed,
    Object? errands = freezed,
    Object? activeErrands = freezed,
    Object? errand = freezed,
    Object? errandsFailure = freezed,
    Object? activeErrandsFailure = freezed,
  }) {
    return _then(_ErrandState(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as bool,
      errands: errands == freezed
          ? _value.errands
          : errands // ignore: cast_nullable_to_non_nullable
              as List<Errand>,
      activeErrands: activeErrands == freezed
          ? _value.activeErrands
          : activeErrands // ignore: cast_nullable_to_non_nullable
              as List<Errand>,
      errand: errand == freezed
          ? _value.errand
          : errand // ignore: cast_nullable_to_non_nullable
              as Errand?,
      errandsFailure: errandsFailure == freezed
          ? _value.errandsFailure
          : errandsFailure // ignore: cast_nullable_to_non_nullable
              as Failure,
      activeErrandsFailure: activeErrandsFailure == freezed
          ? _value.activeErrandsFailure
          : activeErrandsFailure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_ErrandState implements _ErrandState {
  const _$_ErrandState(
      {required this.loading,
      required this.created,
      required this.errands,
      required this.activeErrands,
      this.errand,
      required this.errandsFailure,
      required this.activeErrandsFailure});

  @override
  final bool loading;
  @override
  final bool created;
  @override
  final List<Errand> errands;
  @override
  final List<Errand> activeErrands;
  @override
  final Errand? errand;
  @override
  final Failure errandsFailure;
  @override
  final Failure activeErrandsFailure;

  @override
  String toString() {
    return 'ErrandState(loading: $loading, created: $created, errands: $errands, activeErrands: $activeErrands, errand: $errand, errandsFailure: $errandsFailure, activeErrandsFailure: $activeErrandsFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ErrandState &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality().equals(other.created, created) &&
            const DeepCollectionEquality().equals(other.errands, errands) &&
            const DeepCollectionEquality()
                .equals(other.activeErrands, activeErrands) &&
            const DeepCollectionEquality().equals(other.errand, errand) &&
            const DeepCollectionEquality()
                .equals(other.errandsFailure, errandsFailure) &&
            const DeepCollectionEquality()
                .equals(other.activeErrandsFailure, activeErrandsFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(created),
      const DeepCollectionEquality().hash(errands),
      const DeepCollectionEquality().hash(activeErrands),
      const DeepCollectionEquality().hash(errand),
      const DeepCollectionEquality().hash(errandsFailure),
      const DeepCollectionEquality().hash(activeErrandsFailure));

  @JsonKey(ignore: true)
  @override
  _$ErrandStateCopyWith<_ErrandState> get copyWith =>
      __$ErrandStateCopyWithImpl<_ErrandState>(this, _$identity);
}

abstract class _ErrandState implements ErrandState {
  const factory _ErrandState(
      {required bool loading,
      required bool created,
      required List<Errand> errands,
      required List<Errand> activeErrands,
      Errand? errand,
      required Failure errandsFailure,
      required Failure activeErrandsFailure}) = _$_ErrandState;

  @override
  bool get loading;
  @override
  bool get created;
  @override
  List<Errand> get errands;
  @override
  List<Errand> get activeErrands;
  @override
  Errand? get errand;
  @override
  Failure get errandsFailure;
  @override
  Failure get activeErrandsFailure;
  @override
  @JsonKey(ignore: true)
  _$ErrandStateCopyWith<_ErrandState> get copyWith =>
      throw _privateConstructorUsedError;
}
