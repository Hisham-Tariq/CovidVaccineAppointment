import 'package:covid_app/app/ui/global_widgets/bottom_sheet.dart';
import 'package:covid_app/app/ui/global_widgets/spacer.dart';
import 'package:covid_app/app/ui/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

import '../../../controllers/get_user_info_controller.dart';

class GetUserInfoPage extends GetView<GetUserInfoController> {
  const GetUserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Text(
                      'Your Information',
                      style: Themes.defaultFontFamily.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 32.0,
                      ),
                    ),
                    Text(
                      'Fill your information to continue',
                      style: Themes.defaultFontFamily.copyWith(
                        fontSize: 13.0,
                      ),
                    ),
                    const VerticalSpacer(space: 30.0),
                    TextFormField(
                      controller: controller.firstNameController,
                      cursorColor: context.theme.colorScheme.secondary,
                      cursorHeight: 25.0,
                      cursorRadius: const Radius.circular(32.0),
                      cursorWidth: 5,
                      style: context.textTheme.bodyText2!.copyWith(
                        fontSize: 18.0,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'First name should not be empty';
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                      ),
                    ),
                    const VerticalSpacer(),
                    TextFormField(
                      controller: controller.lastNameController,
                      cursorColor: context.theme.colorScheme.secondary,
                      cursorHeight: 25.0,
                      cursorRadius: const Radius.circular(32.0),
                      cursorWidth: 5,
                      style: context.textTheme.bodyText2!.copyWith(
                        fontSize: 18.0,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Last name should not be empty';
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                      ),
                    ),
                    const VerticalSpacer(),
                    TextFormField(
                      controller: controller.idController,
                      cursorColor: context.theme.colorScheme.secondary,
                      cursorHeight: 25.0,
                      cursorRadius: const Radius.circular(32.0),
                      cursorWidth: 5,
                      style: context.textTheme.bodyText2!.copyWith(
                        fontSize: 18.0,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'ID name should not be empty';
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'ID',
                      ),
                    ),
                    const VerticalSpacer(),
                    TextFormField(
                      controller: controller.dobController,
                      cursorColor: context.theme.colorScheme.secondary,
                      cursorHeight: 25.0,
                      cursorRadius: const Radius.circular(32.0),
                      cursorWidth: 5,
                      style: context.textTheme.bodyText2!.copyWith(
                        fontSize: 18.0,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Date of Birth should not be empty';
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Date of Birth',
                      ),
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        await DatePicker.showDatePicker(
                          context,
                          showTitleActions: true,
                          minTime: DateTime(1920, 1, 1),
                          maxTime: DateTime.now(),
                          onCancel: () {
                            print('sdfsdf');
                          },
                          onConfirm: controller.onConfirmDOB,
                          currentTime: DateTime.now(),
                          locale: LocaleType.en,
                        );
                        FocusScope.of(context).unfocus();
                      },
                    ),
                    const VerticalSpacer(),
                    TextFormField(
                      controller: controller.addressController,
                      cursorColor: context.theme.colorScheme.secondary,
                      cursorHeight: 25.0,
                      cursorRadius: const Radius.circular(32.0),
                      cursorWidth: 5,
                      style: context.textTheme.bodyText2!.copyWith(
                        fontSize: 18.0,
                      ),
                      validator: (value) {
                        if (controller.dob == null) {
                          return 'Address should not be empty';
                        }
                      },
                      minLines: 3,
                      maxLines: 6,
                      decoration: const InputDecoration(
                        labelText: 'Address',
                      ),
                    ),
                    const VerticalSpacer(space: 24.0),
                    TextButton(
                      onPressed: () {
                        controller.saveUserInformation();
                      },
                      child: const Text('Save'),
                      style: TextButton.styleFrom(
                        minimumSize: Size(Get.width, 50),
                      ),
                    ),
                    const VerticalSpacer(space: 24.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
