// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      nid: json['nid'] as String,
      dob: json['dob'] as String,
      address: json['address'] as String,
      email: json['email'] as String,
      timesVaccinated: json['timesVaccinated'] as int? ?? 0,
      photoUrl: json['photoUrl'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'nid': instance.nid,
      'dob': instance.dob,
      'address': instance.address,
      'email': instance.email,
      'timesVaccinated': instance.timesVaccinated,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
