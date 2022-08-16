// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vaccination_center.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VaccinationCenter _$VaccinationCenterFromJson(Map<String, dynamic> json) {
  return _VaccinationCenter.fromJson(json);
}

/// @nodoc
class _$VaccinationCenterTearOff {
  const _$VaccinationCenterTearOff();

  _VaccinationCenter call(
      {String? id,
      required String name,
      String? createdAt,
      String? updatedAt}) {
    return _VaccinationCenter(
      id: id,
      name: name,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  VaccinationCenter fromJson(Map<String, Object> json) {
    return VaccinationCenter.fromJson(json);
  }
}

/// @nodoc
const $VaccinationCenter = _$VaccinationCenterTearOff();

/// @nodoc
mixin _$VaccinationCenter {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VaccinationCenterCopyWith<VaccinationCenter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccinationCenterCopyWith<$Res> {
  factory $VaccinationCenterCopyWith(
          VaccinationCenter value, $Res Function(VaccinationCenter) then) =
      _$VaccinationCenterCopyWithImpl<$Res>;
  $Res call({String? id, String name, String? createdAt, String? updatedAt});
}

/// @nodoc
class _$VaccinationCenterCopyWithImpl<$Res>
    implements $VaccinationCenterCopyWith<$Res> {
  _$VaccinationCenterCopyWithImpl(this._value, this._then);

  final VaccinationCenter _value;
  // ignore: unused_field
  final $Res Function(VaccinationCenter) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$VaccinationCenterCopyWith<$Res>
    implements $VaccinationCenterCopyWith<$Res> {
  factory _$VaccinationCenterCopyWith(
          _VaccinationCenter value, $Res Function(_VaccinationCenter) then) =
      __$VaccinationCenterCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String name, String? createdAt, String? updatedAt});
}

/// @nodoc
class __$VaccinationCenterCopyWithImpl<$Res>
    extends _$VaccinationCenterCopyWithImpl<$Res>
    implements _$VaccinationCenterCopyWith<$Res> {
  __$VaccinationCenterCopyWithImpl(
      _VaccinationCenter _value, $Res Function(_VaccinationCenter) _then)
      : super(_value, (v) => _then(v as _VaccinationCenter));

  @override
  _VaccinationCenter get _value => super._value as _VaccinationCenter;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_VaccinationCenter(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VaccinationCenter extends _VaccinationCenter {
  const _$_VaccinationCenter(
      {this.id, required this.name, this.createdAt, this.updatedAt})
      : super._();

  factory _$_VaccinationCenter.fromJson(Map<String, dynamic> json) =>
      _$$_VaccinationCenterFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'VaccinationCenter(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VaccinationCenter &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt);

  @JsonKey(ignore: true)
  @override
  _$VaccinationCenterCopyWith<_VaccinationCenter> get copyWith =>
      __$VaccinationCenterCopyWithImpl<_VaccinationCenter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VaccinationCenterToJson(this);
  }
}

abstract class _VaccinationCenter extends VaccinationCenter {
  const factory _VaccinationCenter(
      {String? id,
      required String name,
      String? createdAt,
      String? updatedAt}) = _$_VaccinationCenter;
  const _VaccinationCenter._() : super._();

  factory _VaccinationCenter.fromJson(Map<String, dynamic> json) =
      _$_VaccinationCenter.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get createdAt => throw _privateConstructorUsedError;
  @override
  String? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VaccinationCenterCopyWith<_VaccinationCenter> get copyWith =>
      throw _privateConstructorUsedError;
}
