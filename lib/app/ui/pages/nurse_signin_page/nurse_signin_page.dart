import 'package:covid_app/app/ui/assets/assets.gen.dart';
import 'package:covid_app/app/ui/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/nurse_signin_controller.dart';

class NurseSigninPage extends GetView<NurseSigninController> {
  const NurseSigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const VerticalSpacer(space: 32.0),
                Image.asset(
                  Assets.assetsLogo,
                  height: 120,
                ),
                const VerticalSpacer(space: 32.0),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.emailController,
                        cursorColor: context.theme.colorScheme.secondary,
                        cursorHeight: 25.0,
                        cursorRadius: const Radius.circular(32.0),
                        cursorWidth: 5,
                        style: context.textTheme.bodyText2!.copyWith(
                          fontSize: 18.0,
                        ),
                        validator: controller.validateEmail,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                      const VerticalSpacer(space: 16.0),
                      TextFormField(
                        controller: controller.passwordController,
                        cursorColor: context.theme.colorScheme.secondary,
                        obscureText: true,
                        cursorHeight: 25.0,
                        cursorRadius: const Radius.circular(32.0),
                        cursorWidth: 5,
                        style: context.textTheme.bodyText2!.copyWith(
                          fontSize: 18.0,
                        ),
                        validator: controller.validatePassword,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                      const VerticalSpacer(space: 32),
                      TextButton(
                        onPressed: controller.signInNurse,
                        child: const Text('Login'),
                        style: TextButton.styleFrom(
                          minimumSize: Size(Get.width, 50),
                        ),
                      ),
                      const VerticalSpacer(space: 24.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
