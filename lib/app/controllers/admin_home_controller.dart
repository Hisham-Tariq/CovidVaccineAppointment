import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class AdminHomeController extends GetxController {
  final navIndex = 1.obs;

  void updateNavIndex(int value) {
    navIndex.value = value;
  }
}