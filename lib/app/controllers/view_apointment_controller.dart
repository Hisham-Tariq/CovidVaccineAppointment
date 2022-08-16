import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_app/app/data/models/appointment_model/appointment_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'user_controller.dart';

class ViewApointmentController extends GetxController {
  final _appointmentsReference = FirebaseFirestore.instance.collection('appointments');
  final _userController = Get.find<UserController>();
  AppointmentModel? currentAppointment;
  bool doneFetching = false;

  @override
  void onInit() async {
    super.onInit();
    var appointments = await _appointmentsReference.where('bookedBy', isEqualTo: _userController.currentUserId).get();
    doneFetching = true;
    var filtered = appointments.docs
        .where(
          (element) => element['status'] == 'pending' || element['status'] == 'approved',
        )
        .toList();
    if (filtered.isNotEmpty) {
      currentAppointment = AppointmentModel.fromDocument(filtered[0]);
    }
    update();
  }

  void checkForAppointmentUpdates() async {
    var appointments = await _appointmentsReference
        .where('bookedBy', isEqualTo: _userController.currentUserId)
        .where(
          'status',
          isEqualTo: 'pending',
        )
        .get();
    doneFetching = true;
    Fluttertoast.showToast(msg: 'Refreshed Successfully');
    if (appointments.docs.isNotEmpty) {
      currentAppointment = AppointmentModel.fromDocument(appointments.docs[0]);
    }
    update();
  }
}
