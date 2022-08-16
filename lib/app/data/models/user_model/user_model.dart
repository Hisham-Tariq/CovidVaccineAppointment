import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/model_helpers.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel implements _$UserModel {
  const UserModel._();

  const factory UserModel({
    String? id,
    required String firstName,
    required String lastName,
    required String nid,
    required String dob,
    required String address,
    required String email,
    @Default(0) int timesVaccinated,
    String? photoUrl,
    String? createdAt,
    String? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.empty() => const UserModel(
        email: '',
        firstName: '',
        lastName: '',
        address: '',
        dob: '',
        nid: '',
      );

  factory UserModel.fromDocument(DocumentSnapshot doc) =>
      UserModel.fromJson(ModelHelpers().fromDocument(doc.data()!))
          .copyWith(id: doc.id);

  Map<String, dynamic> toDocument() => ModelHelpers().toDocument(toJson());
}
