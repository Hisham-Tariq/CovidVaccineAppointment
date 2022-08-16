import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _getStorage = GetStorage();
  final storageKey = 'themeMode';
  final currentThemeMode = ThemeMode.system.obs;

  @override
  onInit() {
    super.onInit();
    var window = WidgetsBinding.instance!.window;
    window.onPlatformBrightnessChanged = () {
      if (isSystemThemeModeEnabled) {
        if (Get.isDialogOpen!) Get.back();
        _changeThemeMode();
      }
    };
    _changeThemeMode();
  }

  bool get isSystemThemeModeEnabled => getThemeMode() == ThemeMode.system.index;

  // getSystemTheme() => SchedulerBinding.instance!.window.platformBrightness;

  int getThemeMode() {
    return _getStorage.read(storageKey) ?? currentThemeMode.value.index;
  }

  // ThemeMode getAppThemeMode() {
  //   return _getStorage.read(storageKey) ?? ThemeMode.system;
  // }
  getThemeModeFromIndex(int index) {
    if (index == ThemeMode.system.index) {
      return ThemeMode.system;
    } else if (index == ThemeMode.light.index) {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }

  void saveThemeMode(ThemeMode themeMode) {
    _getStorage.write(storageKey, themeMode.index);
    _changeThemeMode();
  }

  void _changeThemeMode() {
    currentThemeMode.value = getThemeModeFromIndex(getThemeMode());
    Get.changeThemeMode(currentThemeMode.value);
  }

  String activeThemeModeName() {
    if (currentThemeMode.value == ThemeMode.system) {
      return 'System Default';
    } else if (currentThemeMode.value == ThemeMode.light) {
      return 'Light';
    } else {
      return 'Dark';
    }
  }
}
