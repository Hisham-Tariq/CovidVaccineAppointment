import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_app/app/data/models/appointment_model/appointment_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AdminViewAppointmentsController extends GetxController {
  final _appointmentsReference = FirebaseFirestore.instance.collection('appointments');
  var bookedAppointments = <AppointmentModel>[];
  bool doneFetching = false;
  StreamSubscription<QuerySnapshot>? appointmentsListner;

  @override
  void onInit() {
    super.onInit();
    fetchPendingAppointments();
  }

  fetchPendingAppointments() async {
    appointmentsListner = _appointmentsReference
        .where(
          'status',
          isEqualTo: 'pending',
        )
        .orderBy('createdAt', descending: false)
        .snapshots()
        .listen((event) {
      event.docChanges.length.printInfo();
      doneFetching = true;
      bookedAppointments = event.docs.map((e) {
        return AppointmentModel.fromDocument(e);
      }).toList();
      // event.docs.forEach((e) => e.data().printInfo());
      update();
    });
  }

  @override
  onClose() {
    appointmentsListner!.cancel();
  }

  onConfirmApproveAppointment(DateTime time, AppointmentModel appointment) async {
    for (var element in (await _appointmentsReference.where('status', isEqualTo: 'approved').get()).docs) {
      var date1 = DateTime.parse(AppointmentModel.fromDocument(element).appointmentDate!);
      var difference = date1.difference(time);
      if (difference.inMinutes.abs() < 15) {
        Fluttertoast.showToast(
          msg: 'Already have an appointment on ${date1.toString()}',
          toastLength: Toast.LENGTH_LONG,
        );
        return;
      }
    }

    await _appointmentsReference.doc(appointment.id).update({
      "appointmentDate": time.toString(),
      "status": "approved",
    });
    Fluttertoast.showToast(msg: 'Appointment has been Approved');
  }
}
