import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_app/app/ui/assets/assets.gen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import '../../../controllers/user_controller.dart';
import '../../theme/themes.dart';
import '../../../routes/app_routes.dart';
import '../../global_widgets/global_widgets.dart';
import '../../../controllers/controllers.dart';

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

class HomePage extends GetView<HomeController> {
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

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: context.theme.colorScheme.secondary,
      //   title: const Text('Home'),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            const VerticalSpacer(),
            Text(
              'Vaccination Appointment System',
              style: Themes.defaultFontFamily.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        DashboardTile(
                          title: 'Book Appointments',
                          img: Assets.assetsBookAppointment,
                          onTap: () => Get.toNamed(AppRoutes.BOOK_APPOINTMENT),
                        ),
                        const HorizontalSpacer(space: 16.0),
                        DashboardTile(
                          onTap: () => Get.toNamed(AppRoutes.VIEW_APOINTMENT),
                          title: 'View Appointments',
                          img: Assets.assetsViewAppointment,
                        ),
                      ],
                    ),
                    const VerticalSpacer(),
                    Row(
                      children: [
                        DashboardTile(
                          title: 'Generate Certificate',
                          img: Assets.assetsCertificate,
                          onTap: () => Get.toNamed(AppRoutes.GENERATE_CERTIFICATE),
                        ),
                        const HorizontalSpacer(space: 16.0),
                        DashboardTile(
                          onTap: () => Get.toNamed(AppRoutes.SETTINGS),
                          title: 'Settings',
                          img: Assets.assetsSetting,
                        ),
                      ],
                    ),
                    const VerticalSpacer(),
                    Row(
                      children: [
                        DashboardTile(
                          onTap: Get.find<UserController>().logout,
                          title: 'Log Out',
                          img: Assets.assetsLogout,
                        ),
                        const HorizontalSpacer(space: 16.0),
                        Expanded(
                          child: Container(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardTile extends StatelessWidget {
  const DashboardTile({
    Key? key,
    required this.onTap,
    required this.title,
    required this.img,
  }) : super(key: key);

  final Callback onTap;
  final String title;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                img,
                fit: BoxFit.cover,
                width: 80,
                height: 80,
              ),
              Text(
                title,
                style: Themes.defaultFontFamily.copyWith(
                  fontSize: 14.0,
                  // color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.background,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                // offset: Offset.zero,
                blurRadius: 5.0,
                spreadRadius: 5.0,
                color: context.theme.brightness == Brightness.light ? Colors.grey.shade300 : Colors.grey.shade900,
              ),
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
