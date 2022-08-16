import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../../../controllers/theme_controller.dart';
import '../../theme/themes.dart';

import '../../../controllers/settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: context.theme.colorScheme.onBackground,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ListTile(
              title: const Text(
                'Theme',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Obx(() => Text(
                    Get.find<ThemeController>().activeThemeModeName(),
                  )),
              onTap: () {
                Get.dialog(const _ThemeChangingDialog());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeChangingDialog extends GetView<ThemeController> {
  const _ThemeChangingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 250,
        width: 200,
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(28.0, 20.0, 28.0, 0.0),
                  child: Text(
                    'Chose Theme',
                    style: Themes.defaultFontFamily.copyWith(
                      color: context.theme.colorScheme.onBackground,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                RadioListTile(
                  title: Text(
                    'Light',
                    style: Themes.defaultFontFamily.copyWith(
                      color: context.theme.colorScheme.onBackground,
                    ),
                  ),
                  value: ThemeMode.light.index,
                  onChanged: (value) {
                    controller.saveThemeMode(ThemeMode.light);
                    Get.back();
                  },
                  groupValue: controller.currentThemeMode.value.index,
                ),
                RadioListTile(
                  title: Text(
                    'Dark',
                    style: Themes.defaultFontFamily.copyWith(
                      color: context.theme.colorScheme.onBackground,
                    ),
                  ),
                  value: ThemeMode.dark.index,
                  onChanged: (value) {
                    controller.saveThemeMode(ThemeMode.dark);
                    Get.back();
                  },
                  groupValue: controller.currentThemeMode.value.index,
                ),
                RadioListTile(
                  title: Text(
                    'System Default',
                    style: Themes.defaultFontFamily.copyWith(
                      color: context.theme.colorScheme.onBackground,
                    ),
                  ),
                  value: ThemeMode.system.index,
                  onChanged: (value) {
                    controller.saveThemeMode(ThemeMode.system);
                    Get.back();
                  },
                  groupValue: controller.currentThemeMode.value.index,
                ),
              ],
            )),
      ),
    );
  }
}
