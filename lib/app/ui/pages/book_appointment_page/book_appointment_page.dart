import 'package:covid_app/app/ui/global_widgets/global_widgets.dart';
import 'package:covid_app/app/ui/theme/themes.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/book_appointment_controller.dart';

class BookAppointmentPage extends GetView<BookAppointmentController> {
  const BookAppointmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BookAppointmentController>(builder: (_) {
        if (!controller.isDoneFetching) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(context.theme.colorScheme.secondary),
            ),
          );
        }
        return SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Book Appointment',
                style: Themes.defaultFontFamily.copyWith(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const VerticalSpacer(space: 32.0),
              Obx(
                () => DropdownSearch<String>(
                  mode: Mode.BOTTOM_SHEET,
                  items: controller.vacinationCenters.map((data) => data.name).toList(),
                  onChanged: (value) {
                    controller.vaccinationCenter.value = value!;
                  },
                  selectedItem: controller.vaccinationCenter.value,
                  showSearchBox: true,
                  popupBackgroundColor: context.theme.colorScheme.background,
                  searchFieldProps: TextFieldProps(
                    decoration: const InputDecoration(
                      labelText: 'Search',
                    ),
                  ),
                  dropdownSearchDecoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                    // hintText: 'Vaccine Type',
                    labelText: 'Vaccination Center',
                  ),
                ),
              ),
              const VerticalSpacer(space: 20.0),
              Obx(
                () => DropdownSearch<String>(
                  mode: Mode.BOTTOM_SHEET,
                  items: controller.vaccines.map((data) => data.name).toList(),
                  onChanged: (value) {
                    controller.selectedVaccine.value = value!;
                  },
                  selectedItem: controller.selectedVaccine.value,
                  showSearchBox: true,
                  popupBackgroundColor: context.theme.colorScheme.background,
                  searchFieldProps: TextFieldProps(
                    decoration: const InputDecoration(
                      labelText: 'Search',
                    ),
                  ),
                  dropdownSearchDecoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                    // hintText: 'Vaccine Type',
                    labelText: 'Vaccine Type',
                  ),
                ),
              ),
              const VerticalSpacer(space: 32.0),
              GetBuilder<BookAppointmentController>(builder: (_) {
                return TextButton(
                  onPressed: controller.isEligibleToBook ? controller.bookAppointment : null,
                  child: const Text('Book Now'),
                  style: TextButton.styleFrom(
                    minimumSize: Size(Get.width, 50),
                  ),
                );
              })
            ],
          ),
        ));
      }),
    );
  }
}
