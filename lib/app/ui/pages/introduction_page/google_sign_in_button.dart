import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controllers/introduction_controller.dart';
import '../../assets/assets.gen.dart';
import '../../global_widgets/global_widgets.dart';
import '../../theme/themes.dart';
import '../../../states/introduction_state.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<IntroductionController>(
      init: IntroductionController(),
      initState: (_) {},
      builder: (controller) {
        Widget child = Container();
        if (controller.loginState.value == LoginState.idle) {
          child = _idle(context);
        } else if (controller.loginState.value == LoginState.busy) {
          child = const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          );
        } else if (controller.loginState.value == LoginState.done) {
          child = Row(
            children: [
              const Icon(Icons.check, color: Colors.green),
              const HorizontalSpacer(),
              Text(
                'Successfully Logged In',
                style: Themes.defaultFontFamily.copyWith(
                  color: context.theme.colorScheme.onSecondary,
                ),
              ),
            ],
          );
        } else {
          child = Row(
            children: [
              const Icon(Icons.cancel_outlined, color: Colors.red),
              const HorizontalSpacer(),
              Text(
                'Failed to Log In',
                style: Themes.defaultFontFamily.copyWith(
                  color: context.theme.colorScheme.onSecondary,
                ),
              ),
            ],
          );
        }
        return GestureDetector(
          onTap: controller.authWithGoogle,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            height: 50,
            width: controller.loginState.value != LoginState.busy ? 220 : 80,
            child: Center(
              child: FittedBox(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: child,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(1000.0),
            ),
          ),
        );
      },
    );
  }

  Row _idle(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.assetsSvgGoogleIcon,
          height: 14.0,
        ),
        const HorizontalSpacer(),
        Text(
          'Get Your Vaccine',
          style: Themes.defaultFontFamily.copyWith(
            color: context.theme.colorScheme.onSecondary,
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
