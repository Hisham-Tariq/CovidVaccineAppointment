import 'package:covid_app/app/ui/global_widgets/spacer.dart';
import 'package:covid_app/app/ui/theme/themes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/view_apointment_controller.dart';

class ViewApointmentPage extends GetView<ViewApointmentController> {
  const ViewApointmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ViewApointmentController>(
        builder: (_) {
          if (!controller.doneFetching) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  context.theme.colorScheme.secondary,
                ),
              ),
            );
          } else if (controller.currentAppointment == null) {
            return Center(
              child: Text(
                'No booked appointment',
                style: Themes.defaultFontFamily.copyWith(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            );
          } else {
            return SafeArea(
              child: SizedBox(
                width: Get.width,
                height: Get.height,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Appointment Detail',
                          style: Themes.defaultFontFamily.copyWith(
                            fontSize: 32.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const VerticalSpacer(space: 20.0),
                      Row(
                        children: [
                          Text(
                            'Vaccination Type: ',
                            style: Themes.defaultFontFamily.copyWith(
                              color: context.theme.colorScheme.secondary,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            controller.currentAppointment!.vaccinationName,
                            style: Themes.defaultFontFamily.copyWith(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      const VerticalSpacer(),
                      Row(
                        children: [
                          Text(
                            'Vaccination Center: ',
                            style: Themes.defaultFontFamily.copyWith(
                              color: context.theme.colorScheme.secondary,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            controller.currentAppointment!.centerName,
                            style: Themes.defaultFontFamily.copyWith(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      const VerticalSpacer(),
                      Row(
                        children: [
                          Text(
                            'Booking Date: ',
                            style: Themes.defaultFontFamily.copyWith(
                              color: context.theme.colorScheme.secondary,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            controller.currentAppointment!.createdAt!,
                            style: Themes.defaultFontFamily.copyWith(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      const VerticalSpacer(),
                      Row(
                        children: [
                          Text(
                            'Vaccnination Date: ',
                            style: Themes.defaultFontFamily.copyWith(
                              color: context.theme.colorScheme.secondary,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            controller.currentAppointment!.status == 'pending'
                                ? 'waitng for the date'
                                : controller.currentAppointment!.appointmentDate!,
                            style: Themes.defaultFontFamily.copyWith(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      const VerticalSpacer(),
                      TextButton(
                        onPressed: controller.checkForAppointmentUpdates,
                        child: const Text('Refresh'),
                        style: TextButton.styleFrom(
                          minimumSize: Size(Get.width, 50),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
