import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_app/app/data/models/vaccination_center/vaccination_center.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AdminVaccinationCentersController extends GetxController {
  final _vaccinationCenterRef = FirebaseFirestore.instance.collection('vaccinationCenters');
  final formKey = GlobalKey<FormState>();
  final vaccinationCenterController = TextEditingController();
  final updateCenterController = TextEditingController();
  List<VaccinationCenter> vaccinationCenters = [];
  bool isDoneFetching = false;
  StreamSubscription<QuerySnapshot>? _vaccinationCentersStream;

  final updateFormKey = GlobalKey<FormState>();

  @override
  onInit() {
    super.onInit();
    viewVaccinationCenters();
  }

  addVaccinationCenter() {
    FocusScope.of(Get.context!).unfocus();
    if (!formKey.currentState!.validate()) return;
    var center = VaccinationCenter(name: vaccinationCenterController.text);
    try {
      _vaccinationCenterRef.doc().set(center.toDocument());
      Fluttertoast.showToast(msg: 'Successfully Added');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed to add');
    }
  }

  viewVaccinationCenters() {
    isDoneFetching = true;
    _vaccinationCentersStream = _vaccinationCenterRef.snapshots().listen((event) {
      vaccinationCenters = event.docs.map((e) => VaccinationCenter.fromDocument(e)).toList();
      update();
    });
  }

  @override
  void onClose() {
    super.onClose();
    _vaccinationCentersStream!.cancel();
  }

  String? validateCenter(String? value) {
    if (value!.isEmpty) return "Invalid Center";
  }

  void deleteVaccineCenter(String? id) {
    try {
      _vaccinationCenterRef.doc(id!).delete();
      Fluttertoast.showToast(msg: 'Successfully Deleted');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed to delete');
    }
  }

  updateVaccinationCenter(VaccinationCenter center) {
    if (!updateFormKey.currentState!.validate()) return;
    try {
      var updatedCenter = center.copyWith(
        name: updateCenterController.text,
        updatedAt: DateTime.now().toString(),
      );
      _vaccinationCenterRef.doc(updatedCenter.id!).update(updatedCenter.toDocument());
      Fluttertoast.showToast(msg: 'Successfully Updated');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed to update');
    } finally {
      if (Get.isDialogOpen!) Get.back();
    }
  }
}
