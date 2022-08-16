import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_app/app/controllers/user_controller.dart';
import 'package:covid_app/app/data/models/appointment_model/appointment_model.dart';
import 'package:covid_app/app/data/models/vaccination_center/vaccination_center.dart';
import 'package:covid_app/app/data/models/vaccine/vaccine.dart';
import 'package:covid_app/app/routes/app_routes.dart';
import 'package:covid_app/app/ui/global_widgets/bottom_sheet.dart';
import 'package:covid_app/app/ui/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class BookAppointmentController extends GetxController {
  final _appointmentsReference = FirebaseFirestore.instance.collection('appointments');
  final selectedVaccine = ''.obs;
  final vaccinationCenter = ''.obs;
  final _userController = Get.find<UserController>();
  bool isEligibleToBook = true;
  var vaccines = <Vaccine>[];
  var vacinationCenters = <VaccinationCenter>[];
  bool isDoneFetching = false;

  @override
  onInit() async {
    super.onInit();

    vaccines = (await FirebaseFirestore.instance.collection('vaccine').get()).docs.map((e) {
      return Vaccine.fromDocument(e);
    }).toList();
    vacinationCenters = (await FirebaseFirestore.instance.collection('vaccinationCenters').get()).docs.map((e) {
      return VaccinationCenter.fromDocument(e);
    }).toList();
    var appointments = await _appointmentsReference
        .where('bookedBy', isEqualTo: _userController.currentUserId)
        .where(
          'status',
          isEqualTo: 'pending',
        )
        .get();
    if (Get.find<UserController>().user.timesVaccinated == 2) {
      isEligibleToBook = false;
      Fluttertoast.showToast(msg: 'You have already been vaccinated 2 times');
    } else {
      isEligibleToBook = appointments.docs.isEmpty;
    }

    isDoneFetching = true;
    update();
  }

  bookAppointment() async {
    Get.bottomSheet(const LoadingBottomSheet());
    var appointment = AppointmentModel(
      bookedBy: _userController.currentUserId!,
      centerName: vaccinationCenter.value,
      vaccinationName: selectedVaccine.value,
      clientDob: _userController.user.dob,
      clientEmail: _userController.user.email,
      clientId: _userController.user.nid,
      clientName: "${_userController.user.firstName.capitalize} ${_userController.user.lastName.capitalize}",
      appointmentDate: " ",
    );
    try {
      await _appointmentsReference.doc().set(appointment.toDocument());
      Fluttertoast.showToast(msg: 'Appointment Booked Wait for Approval');
      if (Get.isBottomSheetOpen!) Get.back();
      Get.offNamed(AppRoutes.VIEW_APOINTMENT);
    } catch (e) {
      if (Get.isBottomSheetOpen!) Get.back();
      Fluttertoast.showToast(msg: 'Failed to book appointment');
    }
  }
}

class LoadingBottomSheet extends StatelessWidget {
  const LoadingBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      child: Column(
        children: [
          Text(
            'Booking',
            style: Themes.defaultFontFamily.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 24.0,
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(context.theme.colorScheme.secondary),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
