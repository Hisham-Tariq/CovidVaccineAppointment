import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../data/models/vaccine/vaccine.dart';

class AdminInventoryController extends GetxController {
  final _vaccineRef = FirebaseFirestore.instance.collection('vaccine');
  final formKey = GlobalKey<FormState>();
  final qtyController = TextEditingController();
  final nameController = TextEditingController();

  bool isDoneFetching = false;

  List<Vaccine> vaccines = [];

  final updateFormKey = GlobalKey<FormState>();
  var updateNameController = TextEditingController();
  var updateQtyController = TextEditingController();

  StreamSubscription<QuerySnapshot>? _vaccineStream;

  @override
  onInit() {
    super.onInit();
    viewVaccine();
  }

  String? validateVaccine(String? value) {}

  void addVaccine() {
    FocusScope.of(Get.context!).unfocus();
    if (!formKey.currentState!.validate()) return;
    var vaccine = Vaccine(
        name: nameController.text, quantity: int.parse(qtyController.text));
    try {
      _vaccineRef.doc().set(vaccine.toDocument());
      Fluttertoast.showToast(msg: 'Successfully Added');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed to add');
    }
  }

  viewVaccine() {
    isDoneFetching = true;
    _vaccineStream =
        _vaccineRef.snapshots().listen((event) {
      vaccines =
          event.docs.map((e) => Vaccine.fromDocument(e)).toList();
      update();
    });
  }

  @override
  void onClose() {
    super.onClose();
    _vaccineStream!.cancel();
  }

  String? validateVaccineName(String? value) {
    if (value!.isEmpty) return "Invalid Vaccine Name";
  }

  String? validateVaccineQty(String? value) {
    try {
      int.parse(value!);
      return null;
    } catch (e) {
      return "Invalid Quantity";
    }
  }

  void deleteVaccine(String? id) {
    try {
      _vaccineRef.doc(id!).delete();
      Fluttertoast.showToast(msg: 'Successfully Deleted');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed to delete');
    }
  }

  updateVaccine(Vaccine vaccine) {
    if (!updateFormKey.currentState!.validate()) return;
    try {
      var updatedVaccine = vaccine.copyWith(
        name: updateNameController.text,
        quantity: int.parse(updateQtyController.text),
        updatedAt: DateTime.now().toString(),
      );
      _vaccineRef.doc(updatedVaccine.id!).update(updatedVaccine.toDocument());
      Fluttertoast.showToast(msg: 'Successfully Updated');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed to update');
    } finally {
      if (Get.isDialogOpen!) Get.back();
    }
  }
}
