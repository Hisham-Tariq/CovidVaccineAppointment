
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/model_helpers.dart';

part 'vaccine.freezed.dart';
part 'vaccine.g.dart';

@freezed
abstract class Vaccine implements _$Vaccine {
  const Vaccine._();

  const factory Vaccine({
    String? id,
    required String name,
    required int quantity,
    String? createdAt,
    String? updatedAt,
  }) = _Vaccine;

  factory Vaccine.fromJson(Map<String, dynamic> json) =>
      _$VaccineFromJson(json);

  factory Vaccine.empty() => const Vaccine(name: '', quantity: 0);

  factory Vaccine.fromDocument(DocumentSnapshot doc) =>
      Vaccine.fromJson(ModelHelpers().fromDocument(doc.data()!))
          .copyWith(id: doc.id);

  Map<String, dynamic> toDocument() => ModelHelpers().toDocument(toJson());
}
    