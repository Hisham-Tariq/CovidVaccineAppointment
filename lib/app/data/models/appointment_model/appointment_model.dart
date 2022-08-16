import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/model_helpers.dart';

part 'appointment_model.freezed.dart';
part 'appointment_model.g.dart';

@freezed
abstract class AppointmentModel implements _$AppointmentModel {
  const AppointmentModel._();

  const factory AppointmentModel({
    String? id,
    required String centerName,
    required String vaccinationName,
    required String clientName,
    required String clientDob,
    required String clientEmail,
    required String clientId,
    required String bookedBy,
    String? appointmentDate,
    @Default('pending') String status,
    String? createdAt,
    String? updatedAt,
  }) = _AppointmentModel;

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);

  factory AppointmentModel.empty() => const AppointmentModel(
        vaccinationName: '',
        centerName: '',
        bookedBy: '',
        clientName: '',
        clientDob: '',
        clientEmail: '',
        clientId: '', 
      );

  factory AppointmentModel.fromDocument(DocumentSnapshot doc) =>
      AppointmentModel.fromJson(ModelHelpers().fromDocument(doc.data()!))
          .copyWith(id: doc.id);

  Map<String, dynamic> toDocument() => ModelHelpers().toDocument(toJson());
}
