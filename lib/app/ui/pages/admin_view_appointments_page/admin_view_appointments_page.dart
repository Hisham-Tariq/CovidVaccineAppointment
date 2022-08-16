import 'package:covid_app/app/data/models/appointment_model/appointment_model.dart';
import 'package:covid_app/app/ui/global_widgets/spacer.dart';
import 'package:covid_app/app/ui/pages/admin_inventory_page/admin_inventory_page.dart';
import 'package:covid_app/app/ui/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

import '../../../controllers/admin_view_appointments_controller.dart';

class AdminViewAppointmentsPage extends GetView<AdminViewAppointmentsController> {
  const AdminViewAppointmentsPage({Key? key}) : super(key: key);

  ageCalculator(int days) {
    return days ~/ 365;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AdminViewAppointmentsController>(builder: (_) {
        if (!controller.doneFetching) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                context.theme.colorScheme.secondary,
              ),
            ),
          );
        } else if (controller.bookedAppointments.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'No Pending Appointments',
                textAlign: TextAlign.center,
                style: Themes.defaultFontFamily.copyWith(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          );
        } else {
          return SizedBox(
            height: Get.height,
            width: Get.width,
            child: ListView.builder(
              itemCount: controller.bookedAppointments.length,
              itemBuilder: (context, index) {
                var appointment = controller.bookedAppointments[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    height: 350,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.background,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          // offset: Offset.zero,
                          blurRadius: 5.0,
                          spreadRadius: 5.0,
                          color: context.theme.brightness == Brightness.light ? Colors.grey.shade300 : Colors.grey.shade900,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VerticalSpacer(),
                        SizedBox(
                          width: Get.width,
                          child: CircleAvatar(
                            backgroundColor: context.theme.colorScheme.secondary,
                            child: Text(
                              (index + 1).toString(),
                              style: Themes.defaultFontFamily.copyWith(
                                color: context.theme.colorScheme.onSecondary,
                              ),
                            ),
                          ),
                        ),
                        _LabelInfo(
                          title: 'Center',
                          value: appointment.centerName,
                        ),
                        const VerticalSpacer(space: 5),
                        _LabelInfo(
                          title: 'Vaccination',
                          value: appointment.vaccinationName,
                        ),
                        const VerticalSpacer(space: 5),
                        _LabelInfo(
                          title: 'Booked At',
                          value: appointment.createdAt!,
                        ),
                        const VerticalSpacer(space: 5),
                        _LabelInfo(
                          title: 'Client Name',
                          value: appointment.clientName,
                        ),
                        const VerticalSpacer(space: 5),
                        _LabelInfo(
                          title: 'Client Email',
                          value: appointment.clientEmail,
                        ),
                        const VerticalSpacer(space: 5),
                        _LabelInfo(
                          title: 'Client ID',
                          value: appointment.clientId,
                        ),
                        const VerticalSpacer(space: 5),
                        _LabelInfo(
                          title: 'Client Age',
                          value: ageCalculator(
                            DateTime.now().difference(DateTime.parse(appointment.clientDob)).inDays,
                          ).toString(),
                        ),
                        const VerticalSpacer(),
                        Center(
                          child: TextButton(
                            child: const Text('Approve'),
                            onPressed: () async {
                              await DatePicker.showDateTimePicker(
                                context,
                                theme: DatePickerTheme(
                                  backgroundColor: context.theme.colorScheme.background,
                                  cancelStyle: Themes.defaultFontFamily.copyWith(
                                    color: context.theme.colorScheme.error,
                                  ),
                                  itemStyle: Themes.defaultFontFamily.copyWith(
                                    color: context.theme.colorScheme.onBackground,
                                  ),
                                ),
                                showTitleActions: true,
                                minTime: DateTime(1920, 1, 1),
                                onConfirm: (time) => controller.onConfirmApproveAppointment(time, appointment),
                                currentTime: DateTime.now(),
                                locale: LocaleType.en,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}

class _LabelInfo extends StatelessWidget {
  const _LabelInfo({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(style: Themes.defaultFontFamily, children: [
        TextSpan(
          text: '$title: ',
          style: Themes.defaultFontFamily.copyWith(
            color: context.theme.colorScheme.secondary,
            fontSize: 18.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        TextSpan(
          text: value,
          style: Themes.defaultFontFamily.copyWith(color: context.theme.colorScheme.onBackground),
        ),
      ]),
    );
  }
}
