import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    Key? key,
    this.value = false,
    this.activeColor,
    this.checkColor,
    this.normalColor,
    required this.onTap,
    this.borderRadius,
    this.side,
    this.margin,
    this.size = 20,
  }) : super(key: key);

  final bool value;
  final Color? activeColor;
  final Color? checkColor;
  final Color? normalColor;
  final Function(bool value) onTap;
  final BorderRadius? borderRadius;
  final BorderSide? side;
  final EdgeInsetsGeometry? margin;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: margin ?? const EdgeInsets.all(8.0),
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: value
              ? (activeColor ?? Get.context!.theme.colorScheme.secondary)
              : (normalColor ?? Colors.grey),
          borderRadius: borderRadius,
        ),
        child: value
            ? Icon(
                Icons.check,
                color: checkColor ?? Colors.white,
                size: size,
              )
            : null,
      ),
    );
  }
}
