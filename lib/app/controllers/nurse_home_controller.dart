import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_app/app/data/models/appointment_model/appointment_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class NurseHomeController extends GetxController {
  final _appointmentsReference = FirebaseFirestore.instance.collection('appointments');
  bool doneFetching = false;
  StreamSubscription<QuerySnapshot>? appointmentsListner;

  List<AppointmentModel> approvedAppointments = [];

  @override
  void onInit() {
    super.onInit();
    doneFetching = true;
    fetchApprovedAppointments();
  }

  fetchApprovedAppointments() async {
    appointmentsListner = _appointmentsReference
        .where(
          'status',
          isEqualTo: 'approved',
        )
        .orderBy('appointmentDate', descending: false)
        .snapshots()
        .listen((event) {
      event.docChanges.length.printInfo();
      approvedAppointments = event.docs.map((e) {
        return AppointmentModel.fromDocument(e);
      }).toList();
      update();
    });
  }

  @override
  onClose() {
    appointmentsListner!.cancel();
  }

  onDoneVaccinated(DateTime time, AppointmentModel appointment) async {
    await _appointmentsReference.doc(appointment.id).update({
      "appointmentDate": time.toString(),
      "status": "done",
    });
    Fluttertoast.showToast(msg: 'Successfully Vaccinated');
  }

  void absentClient(AppointmentModel appointment) {
    try {
      _appointmentsReference.doc(appointment.id).update({
        'status': 'absent',
      });
      Fluttertoast.showToast(msg: 'Marked Absented');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed');
    }
  }

  doneVaccinated(AppointmentModel appointment) {
    try {
      _appointmentsReference.doc(appointment.id).update({
        'status': 'done',
      });
      FirebaseFirestore.instance.doc('users/${appointment.bookedBy}').get().then((value) {
        value.reference.path;
        int timesVaccinated = value['timesVaccinated'];
        if (timesVaccinated == 0) {
          var data = appointment.copyWith(
            createdAt: null,
            updatedAt: null,
            appointmentDate: '',
            status: 'pending',
          );
          _appointmentsReference.doc().set(data.toDocument());
        }
        FirebaseFirestore.instance.doc(value.reference.path).update({
          'timesVaccinated': timesVaccinated + 1,
        });
        FirebaseFirestore.instance.collection('vaccine').where('name', isEqualTo: appointment.vaccinationName).get().then((value) {
          var vac = value.docs[0];
          FirebaseFirestore.instance.doc(vac.reference.path).update({'quantity': vac['quantity'] - 1});
        });
      });
      Fluttertoast.showToast(msg: 'Done Vaccinated');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed');
    }
  }
}
