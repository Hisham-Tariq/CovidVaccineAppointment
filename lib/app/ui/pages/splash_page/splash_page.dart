import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../assets/assets.gen.dart';
import '../../../controllers/splash_controller.dart';
import '../../global_widgets/global_widgets.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.5,
              child: Image.asset(
                Assets.assetsLogo,
              ),
            ),
            const VerticalSpacer(space: 20.0),
            BorderedText(
              strokeWidth: 4.0,
              strokeColor: context.theme.colorScheme.secondary,
              child: Text(
                'Vaccine Appointment',
                textAlign: TextAlign.center,
                style: context.textTheme.headline4!.copyWith(
                  letterSpacing: 3,
                  fontSize: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
