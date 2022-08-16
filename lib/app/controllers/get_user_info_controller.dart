import 'package:covid_app/app/controllers/user_controller.dart';
import 'package:covid_app/app/data/models/user_model/user_model.dart';
import 'package:covid_app/app/routes/app_routes.dart';
import 'package:covid_app/app/ui/global_widgets/bottom_sheet.dart';
import 'package:covid_app/app/ui/theme/themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class GetUserInfoController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final idController = TextEditingController();
  final dobController = TextEditingController();
  DateTime? dob;

  onConfirmDOB(DateTime time) {
    dob = time;
    dobController.text = "${time.year}/${time.month}/${time.day}";
    FocusScope.of(Get.context!).unfocus();
  }

  saveUserInformation() async {
    if (!formKey.currentState!.validate()) return;
    var user = FirebaseAuth.instance.currentUser!;
    Get.bottomSheet(const LoadingBottomSheet());
    var controller = Get.find<UserController>();
    controller.user = UserModel(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      address: addressController.text,
      email: user.email!,
      dob: dob.toString(),
      nid: idController.text,
      photoUrl: user.photoURL,
    );
    try {
      await controller.createNewUser();
      Fluttertoast.showToast(msg: 'Saved Successfully');
      if (Get.isBottomSheetOpen!) Get.back();
      Get.offAllNamed(AppRoutes.HOME);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed');
      if (Get.isBottomSheetOpen!) Get.back();
    }
  }
}

class LoadingBottomSheet extends StatelessWidget {
  const LoadingBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      child: Column(
        children: [
          Text(
            'Saving',
            style: Themes.defaultFontFamily.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 24.0,
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(context.theme.colorScheme.secondary),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
