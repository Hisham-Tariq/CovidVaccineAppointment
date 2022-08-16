import 'package:covid_app/app/bindings/admin_vaccination_centers_binding.dart';
import 'package:covid_app/app/controllers/user_controller.dart';
import 'package:covid_app/app/routes/app_routes.dart';
import 'package:covid_app/app/ui/global_widgets/global_widgets.dart';
import 'package:covid_app/app/ui/pages/admin_inventory_page/admin_inventory_page.dart';
import 'package:covid_app/app/ui/pages/admin_vaccination_centers_page/admin_vaccination_centers_page.dart';
import 'package:covid_app/app/ui/pages/admin_view_appointments_page/admin_view_appointments_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../../controllers/admin_home_controller.dart';

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

class AdminHomePage extends GetView<AdminHomeController> {
  AdminHomePage({Key? key}) : super(key: key);
  static const pages = [AdminInventoryPage(), AdminViewAppointmentsPage(), AdminVaccinationCentersPage()];
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
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
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
          body: pages[controller.navIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: context.theme.colorScheme.background,
            onTap: controller.updateNavIndex,
            currentIndex: controller.navIndex.value,
            selectedItemColor: context.theme.colorScheme.secondary,
            items: const [
              BottomNavigationBarItem(
                label: 'Inventory',
                icon: Icon(Icons.store_mall_directory_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Appointments',
                icon: Icon(Icons.bookmark_add_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Centers',
                icon: Icon(Icons.location_city),
              )
            ],
          ),
        ),
      ),
    );
  }
}
