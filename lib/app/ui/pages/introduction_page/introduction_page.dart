import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../assets/assets.gen.dart';
import '../../global_widgets/global_widgets.dart';
import '../../../controllers/introduction_controller.dart';
import '../../theme/themes.dart';
import 'google_sign_in_button.dart';

class IntroductionPage extends GetView<IntroductionController> {
  const IntroductionPage({Key? key}) : super(key: key);

  static const pageTitles = [
    "Get Vaccinated Now Easily",
  ];

  static const pageDesc = [
    "We will help you to get vaccinated as fast as possible",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  _skipSection(),
                  Expanded(
                    child: OrientationBuilder(builder:
                        (BuildContext context, Orientation orientation) {
                      var svgHeight = 0.0, svgWidth = Get.width;
                      final bool isPortrait =
                          orientation == Orientation.portrait;
                      if (isPortrait) {
                        svgHeight = 220.0;
                      } else {
                        svgHeight = 100.0;
                      }
                      return Padding(
                          padding:
                              EdgeInsets.only(bottom: isPortrait ? 16.0 : 0.0),
                          child: PageView.builder(
                            controller: controller.pageController,
                            itemCount: pageTitles.length,
                            onPageChanged: controller.onPageChanged,
                            itemBuilder: (context, index) {
                              return _PageView(
                                svgHeight: svgHeight,
                                svgWidth: svgWidth,
                                image:
                                    context.theme.brightness == Brightness.light
                                        ? Assets.assetsCovid19Dark
                                        : Assets.assetsCovid19Light,
                                title: pageTitles[index],
                                description: pageDesc[index],
                                isPortrait: isPortrait,
                              );
                            },
                          ));
                    }),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
            _pageFooter(context),
          ],
        ),
      ),
    );
  }

  Positioned _pageFooter(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 8.0),
        child: Column(
          children: [
            _buildTermAndPrivacyCheck(context),
            const VerticalSpacer(),
            const GoogleSignInButton(),
            const VerticalSpacer(),
            Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    label: const Text('Sign In as Admin'),
                    icon: const Icon(Icons.alternate_email),
                    onPressed: controller.onAdminLogin,
                    style: TextButton.styleFrom(
                      minimumSize: const Size(220, 50),
                    ),
                  ),
                ),
                const HorizontalSpacer(),
                Expanded(
                  child: TextButton.icon(
                    label: const Text('Sign In as Nurse'),
                    icon: const Icon(Icons.alternate_email),
                    onPressed: controller.onNurseLogin,
                    style: TextButton.styleFrom(
                      minimumSize: const Size(220, 50),
                    ),
                  ),
                ),
              ],
            ),
            const VerticalSpacer(),
          ],
        ),
      ),
    );
  }

  Container _skipSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 50,
      alignment: Alignment.centerRight,
      child: Obx(() => AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: controller.currentPage.value != pageTitles.length - 1
                ? TextButton(
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Skip',
                            style: Themes.defaultFontFamily.copyWith(
                              fontSize: 11.0,
                            ),
                          ),
                          const HorizontalSpacer(space: 4.0),
                          const Icon(Icons.arrow_forward_ios, size: 8.0),
                        ],
                      ),
                    ),
                    onPressed: () {
                      controller.onSkip();
                    },
                    style: TextButton.styleFrom(minimumSize: const Size(60, 0)),
                  )
                : const SizedBox(
                    width: 60,
                  ),
          )),
    );
  }

  openPrivacyPolicyAndTermsOfServices() async {
    var url =
        "https://github.com/hi1521/covid-vaccine-appointment-privacy/blob/main/privacy-policy.md";
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    }
  }

  Row _buildTermAndPrivacyCheck(BuildContext context) {
    return Row(
      children: [
        const HorizontalSpacer(),
        Obx(
          () => CustomCheckBox(
            onTap: controller.toggleTerms,
            value: controller.termsAccepted.value,
            normalColor: Colors.grey.shade300,
            size: 25,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        Expanded(
          child: Wrap(
            direction: Axis.horizontal,
            children: [
              const Text('I agree to the '),
              GestureDetector(
                onTap: openPrivacyPolicyAndTermsOfServices,
                child: Text(
                  'Terms of Services ',
                  style: context.textTheme.bodyText1,
                ),
              ),
              const Text('and '),
              GestureDetector(
                onTap: openPrivacyPolicyAndTermsOfServices,
                child: Text(
                  'Privacy Policy',
                  style: context.textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  GestureDetector _buildNextPageButton(BuildContext context) {
    return GestureDetector(
      onTap: controller.nextPage,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.theme.colorScheme.secondary.withOpacity(0.1),
        ),
        // color: Colors.grey,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                Assets.assetsSvgNext,
                height: 20.0,
                color: context.theme.colorScheme.secondary,
              ),
            ),
            Positioned.fill(
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation<double>(180 / 360),
                child: CircularProgressIndicator(
                  value: controller.progressValue.value,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    context.theme.colorScheme.secondary,
                  ),
                  strokeWidth: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildDotsIndicator(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [0, 1, 2].map((e) {
          bool isReaded = controller.currentPage.value >= e;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            height: 12,
            width: 12,
            decoration: BoxDecoration(
              color: isReaded
                  ? context.theme.colorScheme.secondary
                  : Colors.grey[300],
              borderRadius: BorderRadius.circular(100.0),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _PageView extends StatelessWidget {
  const _PageView({
    Key? key,
    required this.svgHeight,
    required this.svgWidth,
    required this.image,
    required this.title,
    required this.description,
    required this.isPortrait,
  }) : super(key: key);

  final double svgHeight;
  final double svgWidth;
  final String image;
  final String title;
  final String description;
  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 5,
          child: Image.asset(image),
        ),
        const VerticalSpacer(space: 16),
        Flexible(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 80.0,
              vertical: isPortrait ? 16.0 : 0.0,
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Themes.defaultFontFamily.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 44.0,
              vertical: 16.0,
            ),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: Themes.defaultFontFamily.copyWith(
                fontSize: 16.0,
                height: 1.4,
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
