// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppointmentModel _$$_AppointmentModelFromJson(Map<String, dynamic> json) {
  print(json);
  return _$_AppointmentModel(
    id: json['id'] as String?,
    centerName: json['centerName'] as String,
    vaccinationName: json['vaccinationName'] as String,
    clientName: json['clientName'] as String,
    clientDob: json['clientDob'] as String,
    clientEmail: json['clientEmail'] as String,
    clientId: json['clientId'] as String,
    bookedBy: json['bookedBy'] as String,
    appointmentDate: json['appointmentDate'] as String?,
    status: json['status'] as String? ?? 'pending',
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$$_AppointmentModelToJson(_$_AppointmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'centerName': instance.centerName,
      'vaccinationName': instance.vaccinationName,
      'clientName': instance.clientName,
      'clientDob': instance.clientDob,
      'clientEmail': instance.clientEmail,
      'clientId': instance.clientId,
      'bookedBy': instance.bookedBy,
      'appointmentDate': instance.appointmentDate,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
