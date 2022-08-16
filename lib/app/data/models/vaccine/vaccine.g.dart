// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Vaccine _$$_VaccineFromJson(Map<String, dynamic> json) => _$_Vaccine(
      id: json['id'] as String?,
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_VaccineToJson(_$_Vaccine instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
