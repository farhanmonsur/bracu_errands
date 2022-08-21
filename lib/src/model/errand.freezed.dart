// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'errand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Errand _$ErrandFromJson(Map<String, dynamic> json) {
  return _Errand.fromJson(json);
}

/// @nodoc
class _$ErrandTearOff {
  const _$ErrandTearOff();

  _Errand call(
      {String? id,
      required String creatorId,
      String? performerId,
      required String contact,
      required String description,
      required bool isActive,
      required bool isComplete}) {
    return _Errand(
      id: id,
      creatorId: creatorId,
      performerId: performerId,
      contact: contact,
      description: description,
      isActive: isActive,
      isComplete: isComplete,
    );
  }

  Errand fromJson(Map<String, Object?> json) {
    return Errand.fromJson(json);
  }
}

/// @nodoc
const $Errand = _$ErrandTearOff();

/// @nodoc
mixin _$Errand {
  String? get id => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  String? get performerId => throw _privateConstructorUsedError;
  String get contact => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  bool get isComplete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrandCopyWith<Errand> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrandCopyWith<$Res> {
  factory $ErrandCopyWith(Errand value, $Res Function(Errand) then) =
      _$ErrandCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String creatorId,
      String? performerId,
      String contact,
      String description,
      bool isActive,
      bool isComplete});
}

/// @nodoc
class _$ErrandCopyWithImpl<$Res> implements $ErrandCopyWith<$Res> {
  _$ErrandCopyWithImpl(this._value, this._then);

  final Errand _value;
  // ignore: unused_field
  final $Res Function(Errand) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? creatorId = freezed,
    Object? performerId = freezed,
    Object? contact = freezed,
    Object? description = freezed,
    Object? isActive = freezed,
    Object? isComplete = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: creatorId == freezed
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      performerId: performerId == freezed
          ? _value.performerId
          : performerId // ignore: cast_nullable_to_non_nullable
              as String?,
      contact: contact == freezed
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isComplete: isComplete == freezed
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ErrandCopyWith<$Res> implements $ErrandCopyWith<$Res> {
  factory _$ErrandCopyWith(_Errand value, $Res Function(_Errand) then) =
      __$ErrandCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String creatorId,
      String? performerId,
      String contact,
      String description,
      bool isActive,
      bool isComplete});
}

/// @nodoc
class __$ErrandCopyWithImpl<$Res> extends _$ErrandCopyWithImpl<$Res>
    implements _$ErrandCopyWith<$Res> {
  __$ErrandCopyWithImpl(_Errand _value, $Res Function(_Errand) _then)
      : super(_value, (v) => _then(v as _Errand));

  @override
  _Errand get _value => super._value as _Errand;

  @override
  $Res call({
    Object? id = freezed,
    Object? creatorId = freezed,
    Object? performerId = freezed,
    Object? contact = freezed,
    Object? description = freezed,
    Object? isActive = freezed,
    Object? isComplete = freezed,
  }) {
    return _then(_Errand(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: creatorId == freezed
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      performerId: performerId == freezed
          ? _value.performerId
          : performerId // ignore: cast_nullable_to_non_nullable
              as String?,
      contact: contact == freezed
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isComplete: isComplete == freezed
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Errand implements _Errand {
  const _$_Errand(
      {this.id,
      required this.creatorId,
      this.performerId,
      required this.contact,
      required this.description,
      required this.isActive,
      required this.isComplete});

  factory _$_Errand.fromJson(Map<String, dynamic> json) =>
      _$$_ErrandFromJson(json);

  @override
  final String? id;
  @override
  final String creatorId;
  @override
  final String? performerId;
  @override
  final String contact;
  @override
  final String description;
  @override
  final bool isActive;
  @override
  final bool isComplete;

  @override
  String toString() {
    return 'Errand(id: $id, creatorId: $creatorId, performerId: $performerId, contact: $contact, description: $description, isActive: $isActive, isComplete: $isComplete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Errand &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.creatorId, creatorId) &&
            const DeepCollectionEquality()
                .equals(other.performerId, performerId) &&
            const DeepCollectionEquality().equals(other.contact, contact) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.isActive, isActive) &&
            const DeepCollectionEquality()
                .equals(other.isComplete, isComplete));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(creatorId),
      const DeepCollectionEquality().hash(performerId),
      const DeepCollectionEquality().hash(contact),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(isActive),
      const DeepCollectionEquality().hash(isComplete));

  @JsonKey(ignore: true)
  @override
  _$ErrandCopyWith<_Errand> get copyWith =>
      __$ErrandCopyWithImpl<_Errand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ErrandToJson(this);
  }
}

abstract class _Errand implements Errand {
  const factory _Errand(
      {String? id,
      required String creatorId,
      String? performerId,
      required String contact,
      required String description,
      required bool isActive,
      required bool isComplete}) = _$_Errand;

  factory _Errand.fromJson(Map<String, dynamic> json) = _$_Errand.fromJson;

  @override
  String? get id;
  @override
  String get creatorId;
  @override
  String? get performerId;
  @override
  String get contact;
  @override
  String get description;
  @override
  bool get isActive;
  @override
  bool get isComplete;
  @override
  @JsonKey(ignore: true)
  _$ErrandCopyWith<_Errand> get copyWith => throw _privateConstructorUsedError;
}
