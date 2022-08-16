// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'appointment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) {
  return _AppointmentModel.fromJson(json);
}

/// @nodoc
class _$AppointmentModelTearOff {
  const _$AppointmentModelTearOff();

  _AppointmentModel call(
      {String? id,
      required String centerName,
      required String vaccinationName,
      required String clientName,
      required String clientDob,
      required String clientEmail,
      required String clientId,
      required String bookedBy,
      String? appointmentDate,
      String status = 'pending',
      String? createdAt,
      String? updatedAt}) {
    return _AppointmentModel(
      id: id,
      centerName: centerName,
      vaccinationName: vaccinationName,
      clientName: clientName,
      clientDob: clientDob,
      clientEmail: clientEmail,
      clientId: clientId,
      bookedBy: bookedBy,
      appointmentDate: appointmentDate,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  AppointmentModel fromJson(Map<String, Object> json) {
    return AppointmentModel.fromJson(json);
  }
}

/// @nodoc
const $AppointmentModel = _$AppointmentModelTearOff();

/// @nodoc
mixin _$AppointmentModel {
  String? get id => throw _privateConstructorUsedError;
  String get centerName => throw _privateConstructorUsedError;
  String get vaccinationName => throw _privateConstructorUsedError;
  String get clientName => throw _privateConstructorUsedError;
  String get clientDob => throw _privateConstructorUsedError;
  String get clientEmail => throw _privateConstructorUsedError;
  String get clientId => throw _privateConstructorUsedError;
  String get bookedBy => throw _privateConstructorUsedError;
  String? get appointmentDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppointmentModelCopyWith<AppointmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentModelCopyWith<$Res> {
  factory $AppointmentModelCopyWith(
          AppointmentModel value, $Res Function(AppointmentModel) then) =
      _$AppointmentModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String centerName,
      String vaccinationName,
      String clientName,
      String clientDob,
      String clientEmail,
      String clientId,
      String bookedBy,
      String? appointmentDate,
      String status,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$AppointmentModelCopyWithImpl<$Res>
    implements $AppointmentModelCopyWith<$Res> {
  _$AppointmentModelCopyWithImpl(this._value, this._then);

  final AppointmentModel _value;
  // ignore: unused_field
  final $Res Function(AppointmentModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? centerName = freezed,
    Object? vaccinationName = freezed,
    Object? clientName = freezed,
    Object? clientDob = freezed,
    Object? clientEmail = freezed,
    Object? clientId = freezed,
    Object? bookedBy = freezed,
    Object? appointmentDate = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      centerName: centerName == freezed
          ? _value.centerName
          : centerName // ignore: cast_nullable_to_non_nullable
              as String,
      vaccinationName: vaccinationName == freezed
          ? _value.vaccinationName
          : vaccinationName // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: clientName == freezed
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      clientDob: clientDob == freezed
          ? _value.clientDob
          : clientDob // ignore: cast_nullable_to_non_nullable
              as String,
      clientEmail: clientEmail == freezed
          ? _value.clientEmail
          : clientEmail // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: clientId == freezed
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      bookedBy: bookedBy == freezed
          ? _value.bookedBy
          : bookedBy // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentDate: appointmentDate == freezed
          ? _value.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
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
abstract class _$AppointmentModelCopyWith<$Res>
    implements $AppointmentModelCopyWith<$Res> {
  factory _$AppointmentModelCopyWith(
          _AppointmentModel value, $Res Function(_AppointmentModel) then) =
      __$AppointmentModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String centerName,
      String vaccinationName,
      String clientName,
      String clientDob,
      String clientEmail,
      String clientId,
      String bookedBy,
      String? appointmentDate,
      String status,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$AppointmentModelCopyWithImpl<$Res>
    extends _$AppointmentModelCopyWithImpl<$Res>
    implements _$AppointmentModelCopyWith<$Res> {
  __$AppointmentModelCopyWithImpl(
      _AppointmentModel _value, $Res Function(_AppointmentModel) _then)
      : super(_value, (v) => _then(v as _AppointmentModel));

  @override
  _AppointmentModel get _value => super._value as _AppointmentModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? centerName = freezed,
    Object? vaccinationName = freezed,
    Object? clientName = freezed,
    Object? clientDob = freezed,
    Object? clientEmail = freezed,
    Object? clientId = freezed,
    Object? bookedBy = freezed,
    Object? appointmentDate = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_AppointmentModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      centerName: centerName == freezed
          ? _value.centerName
          : centerName // ignore: cast_nullable_to_non_nullable
              as String,
      vaccinationName: vaccinationName == freezed
          ? _value.vaccinationName
          : vaccinationName // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: clientName == freezed
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      clientDob: clientDob == freezed
          ? _value.clientDob
          : clientDob // ignore: cast_nullable_to_non_nullable
              as String,
      clientEmail: clientEmail == freezed
          ? _value.clientEmail
          : clientEmail // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: clientId == freezed
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      bookedBy: bookedBy == freezed
          ? _value.bookedBy
          : bookedBy // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentDate: appointmentDate == freezed
          ? _value.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
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
class _$_AppointmentModel extends _AppointmentModel {
  const _$_AppointmentModel(
      {this.id,
      required this.centerName,
      required this.vaccinationName,
      required this.clientName,
      required this.clientDob,
      required this.clientEmail,
      required this.clientId,
      required this.bookedBy,
      this.appointmentDate,
      this.status = 'pending',
      this.createdAt,
      this.updatedAt})
      : super._();

  factory _$_AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$$_AppointmentModelFromJson(json);

  @override
  final String? id;
  @override
  final String centerName;
  @override
  final String vaccinationName;
  @override
  final String clientName;
  @override
  final String clientDob;
  @override
  final String clientEmail;
  @override
  final String clientId;
  @override
  final String bookedBy;
  @override
  final String? appointmentDate;
  @JsonKey(defaultValue: 'pending')
  @override
  final String status;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'AppointmentModel(id: $id, centerName: $centerName, vaccinationName: $vaccinationName, clientName: $clientName, clientDob: $clientDob, clientEmail: $clientEmail, clientId: $clientId, bookedBy: $bookedBy, appointmentDate: $appointmentDate, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppointmentModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.centerName, centerName) ||
                const DeepCollectionEquality()
                    .equals(other.centerName, centerName)) &&
            (identical(other.vaccinationName, vaccinationName) ||
                const DeepCollectionEquality()
                    .equals(other.vaccinationName, vaccinationName)) &&
            (identical(other.clientName, clientName) ||
                const DeepCollectionEquality()
                    .equals(other.clientName, clientName)) &&
            (identical(other.clientDob, clientDob) ||
                const DeepCollectionEquality()
                    .equals(other.clientDob, clientDob)) &&
            (identical(other.clientEmail, clientEmail) ||
                const DeepCollectionEquality()
                    .equals(other.clientEmail, clientEmail)) &&
            (identical(other.clientId, clientId) ||
                const DeepCollectionEquality()
                    .equals(other.clientId, clientId)) &&
            (identical(other.bookedBy, bookedBy) ||
                const DeepCollectionEquality()
                    .equals(other.bookedBy, bookedBy)) &&
            (identical(other.appointmentDate, appointmentDate) ||
                const DeepCollectionEquality()
                    .equals(other.appointmentDate, appointmentDate)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
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
      const DeepCollectionEquality().hash(centerName) ^
      const DeepCollectionEquality().hash(vaccinationName) ^
      const DeepCollectionEquality().hash(clientName) ^
      const DeepCollectionEquality().hash(clientDob) ^
      const DeepCollectionEquality().hash(clientEmail) ^
      const DeepCollectionEquality().hash(clientId) ^
      const DeepCollectionEquality().hash(bookedBy) ^
      const DeepCollectionEquality().hash(appointmentDate) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt);

  @JsonKey(ignore: true)
  @override
  _$AppointmentModelCopyWith<_AppointmentModel> get copyWith =>
      __$AppointmentModelCopyWithImpl<_AppointmentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppointmentModelToJson(this);
  }
}

abstract class _AppointmentModel extends AppointmentModel {
  const factory _AppointmentModel(
      {String? id,
      required String centerName,
      required String vaccinationName,
      required String clientName,
      required String clientDob,
      required String clientEmail,
      required String clientId,
      required String bookedBy,
      String? appointmentDate,
      String status,
      String? createdAt,
      String? updatedAt}) = _$_AppointmentModel;
  const _AppointmentModel._() : super._();

  factory _AppointmentModel.fromJson(Map<String, dynamic> json) =
      _$_AppointmentModel.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get centerName => throw _privateConstructorUsedError;
  @override
  String get vaccinationName => throw _privateConstructorUsedError;
  @override
  String get clientName => throw _privateConstructorUsedError;
  @override
  String get clientDob => throw _privateConstructorUsedError;
  @override
  String get clientEmail => throw _privateConstructorUsedError;
  @override
  String get clientId => throw _privateConstructorUsedError;
  @override
  String get bookedBy => throw _privateConstructorUsedError;
  @override
  String? get appointmentDate => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  String? get createdAt => throw _privateConstructorUsedError;
  @override
  String? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppointmentModelCopyWith<_AppointmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
