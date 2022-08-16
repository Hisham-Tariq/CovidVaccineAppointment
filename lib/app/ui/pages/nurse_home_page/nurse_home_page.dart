import 'package:covid_app/app/controllers/controllers.dart';
import 'package:covid_app/app/routes/app_routes.dart';
import 'package:covid_app/app/ui/global_widgets/global_widgets.dart';
import 'package:covid_app/app/ui/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../../controllers/nurse_home_controller.dart';

class _PopMenuItemModel {
  final String title;
  final IconData icon;
  final Callback onTap;

  _PopMenuItemModel(this.title, this.icon, this.onTap);
  @override
  String toString() {
    return title.toString();
  }
}

class NurseHomePage extends GetView<NurseHomeController> {
  NurseHomePage({Key? key}) : super(key: key);

  final popMenuData = [
    _PopMenuItemModel(
      'Logout',
      Icons.exit_to_app,
      Get.find<UserController>().logout,
    ),
    _PopMenuItemModel(
      'Settings',
      Icons.settings,
      () => Get.toNamed(AppRoutes.SETTINGS),
    ),
  ];

  ageCalculator(int days) {
    return days ~/ 365;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          PopupMenuButton<_PopMenuItemModel>(
            onSelected: (item) => item.onTap(),
            icon: Icon(
              Icons.more_vert,
              color: context.theme.colorScheme.onBackground,
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            color: context.theme.colorScheme.secondary,
            itemBuilder: (BuildContext context) {
              return popMenuData.map((item) {
                return PopupMenuItem<_PopMenuItemModel>(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  height: 50,
                  // onTap: choice[2] as void Function()?,
                  value: item,
                  child: FittedBox(
                    child: Row(
                      children: [
                        Icon(
                          item.icon,
                          color: context.theme.colorScheme.onSecondary,
                        ),
                        const HorizontalSpacer(),
                        Text(
                          item.title,
                          style: TextStyle(
                            color: context.theme.colorScheme.onSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList();
            },
          ),
          // IconButton(
          //   splashRadius: 25,
          //   icon: Icon(
          //     Icons.more_vert,
          //     color: context.theme.colorScheme.onBackground,
          //   ),
          //   onPressed: () {
          //     Get.toNamed(AppRoutes.SETTINGS);
          //   },
          // ),
        ],
      ),
      body: SafeArea(
        child: GetBuilder<NurseHomeController>(builder: (_) {
          if (!controller.doneFetching) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  context.theme.colorScheme.secondary,
                ),
              ),
            );
          } else if (controller.approvedAppointments.isEmpty) {
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
                itemCount: controller.approvedAppointments.length,
                itemBuilder: (context, index) {
                  var appointment = controller.approvedAppointments[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      height: 330,
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
                            title: 'Appointment Time',
                            value: appointment.appointmentDate!,
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
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    child: const Text('Absent'),
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        primary: context.theme.colorScheme.secondary,
                                        side: BorderSide(
                                          width: 1,
                                          color: context.theme.colorScheme.secondary,
                                        )),
                                    onPressed: () => controller.absentClient(appointment),
                                  ),
                                ),
                                const HorizontalSpacer(),
                                Expanded(
                                  child: TextButton(
                                    child: const Text('Done'),
                                    onPressed: () => controller.doneVaccinated(appointment),
                                  ),
                                ),
                              ],
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
      ),
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
