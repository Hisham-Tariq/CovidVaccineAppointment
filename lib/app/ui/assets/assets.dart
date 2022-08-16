import 'dart:ui';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'assets.gen.dart';

String _svgDefaultColor = '6c63ff';

class AppAssets {
  AppAssets._();
  
}

Future<String> loadAsset(String asset) async {
  return await rootBundle.loadString(asset);
}

String flutterColorToHex(Color color) =>
    color.toString().substring(10, color.toString().length - 1);

changeSvgColor(String svg, [String? to, String? from]) {
  from ??= _svgDefaultColor;
  to ??= flutterColorToHex(Get.context!.theme.colorScheme.secondary);
  if (to.contains('#')) {
    return svg.replaceAll(from, to.substring(1));
  }
  return svg.replaceAll(from, to);
}
