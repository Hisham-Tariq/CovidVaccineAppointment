// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vaccine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Vaccine _$VaccineFromJson(Map<String, dynamic> json) {
  return _Vaccine.fromJson(json);
}

/// @nodoc
class _$VaccineTearOff {
  const _$VaccineTearOff();

  _Vaccine call(
      {String? id,
      required String name,
      required int quantity,
      String? createdAt,
      String? updatedAt}) {
    return _Vaccine(
      id: id,
      name: name,
      quantity: quantity,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  Vaccine fromJson(Map<String, Object> json) {
    return Vaccine.fromJson(json);
  }
}

/// @nodoc
const $Vaccine = _$VaccineTearOff();

/// @nodoc
mixin _$Vaccine {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VaccineCopyWith<Vaccine> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccineCopyWith<$Res> {
  factory $VaccineCopyWith(Vaccine value, $Res Function(Vaccine) then) =
      _$VaccineCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String name,
      int quantity,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$VaccineCopyWithImpl<$Res> implements $VaccineCopyWith<$Res> {
  _$VaccineCopyWithImpl(this._value, this._then);

  final Vaccine _value;
  // ignore: unused_field
  final $Res Function(Vaccine) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? quantity = freezed,
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
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$VaccineCopyWith<$Res> implements $VaccineCopyWith<$Res> {
  factory _$VaccineCopyWith(_Vaccine value, $Res Function(_Vaccine) then) =
      __$VaccineCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String name,
      int quantity,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$VaccineCopyWithImpl<$Res> extends _$VaccineCopyWithImpl<$Res>
    implements _$VaccineCopyWith<$Res> {
  __$VaccineCopyWithImpl(_Vaccine _value, $Res Function(_Vaccine) _then)
      : super(_value, (v) => _then(v as _Vaccine));

  @override
  _Vaccine get _value => super._value as _Vaccine;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? quantity = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_Vaccine(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$_Vaccine extends _Vaccine {
  const _$_Vaccine(
      {this.id,
      required this.name,
      required this.quantity,
      this.createdAt,
      this.updatedAt})
      : super._();

  factory _$_Vaccine.fromJson(Map<String, dynamic> json) =>
      _$$_VaccineFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final int quantity;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'Vaccine(id: $id, name: $name, quantity: $quantity, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Vaccine &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.quantity, quantity) ||
                const DeepCollectionEquality()
                    .equals(other.quantity, quantity)) &&
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
      const DeepCollectionEquality().hash(quantity) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt);

  @JsonKey(ignore: true)
  @override
  _$VaccineCopyWith<_Vaccine> get copyWith =>
      __$VaccineCopyWithImpl<_Vaccine>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VaccineToJson(this);
  }
}

abstract class _Vaccine extends Vaccine {
  const factory _Vaccine(
      {String? id,
      required String name,
      required int quantity,
      String? createdAt,
      String? updatedAt}) = _$_Vaccine;
  const _Vaccine._() : super._();

  factory _Vaccine.fromJson(Map<String, dynamic> json) = _$_Vaccine.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get quantity => throw _privateConstructorUsedError;
  @override
  String? get createdAt => throw _privateConstructorUsedError;
  @override
  String? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VaccineCopyWith<_Vaccine> get copyWith =>
      throw _privateConstructorUsedError;
}
