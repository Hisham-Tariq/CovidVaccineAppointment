import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/model_helpers.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
abstract class Project implements _$Project {
  const Project._();

  const factory Project({
    String? id,
    required String title,
    String? description,
    required String userId,
    @Default(false) bool active,
    String? createdAt,
    String? updatedAt,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  factory Project.empty() => const Project(userId: '', title: '');

  factory Project.fromDocument(DocumentSnapshot doc) =>
      Project.fromJson(ModelHelpers().fromDocument(doc.data()!))
          .copyWith(id: doc.id);

  Map<String, dynamic> toDocument() => ModelHelpers().toDocument(toJson());
}