import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    Key? key,
    this.height,
    this.width,
    required this.child,
  }) : super(key: key);
  final double? height;
  final double? width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: height ?? 200,
      width: width ?? Get.width,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.background,
        borderRadius:
            const BorderRadius.vertical(top: Radius.elliptical(300, 50)),
      ),
      child: child,
    );
  }
}
