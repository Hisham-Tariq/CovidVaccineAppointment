
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/model_helpers.dart';

part 'vaccination_center.freezed.dart';
part 'vaccination_center.g.dart';

@freezed
abstract class VaccinationCenter implements _$VaccinationCenter {
  const VaccinationCenter._();

  const factory VaccinationCenter({
    String? id,
    required String name,
    String? createdAt,
    String? updatedAt,
  }) = _VaccinationCenter;

  factory VaccinationCenter.fromJson(Map<String, dynamic> json) =>
      _$VaccinationCenterFromJson(json);

  factory VaccinationCenter.empty() => const VaccinationCenter(name: '');

  factory VaccinationCenter.fromDocument(DocumentSnapshot doc) =>
      VaccinationCenter.fromJson(ModelHelpers().fromDocument(doc.data()!))
          .copyWith(id: doc.id);

  Map<String, dynamic> toDocument() => ModelHelpers().toDocument(toJson());
}
    