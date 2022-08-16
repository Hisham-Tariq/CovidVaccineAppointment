import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'user_controller.dart';
import '../routes/app_routes.dart';
import '../states/introduction_state.dart';

class IntroductionController extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs;
  var progressValue = 0.33.obs;
  final termsAccepted = false.obs;
  final loginState = LoginState.idle.obs;

  toggleTerms(bool value) => termsAccepted.value = value;

  nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  onPageChanged(int index) {
    currentPage.value = index;
    progressValue.value = 0.33 * (index + 1);
    if (progressValue.value == 0.99) progressValue.value = 1.0;
  }

  void onSkip() {
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void authWithGoogle() async {
    if (loginState.value != LoginState.idle) return;
    if (!termsAccepted.value) {
      Fluttertoast.showToast(
        msg: "Accept Privacy Policy and Terms of Services",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0,
      );
      return;
    }
    loginState.value = LoginState.busy;
    final _auth = FirebaseAuth.instance;
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn();
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      loginState.value = LoginState.done;
      _afterAuthuenticated(userCredential.user);
    } catch (e) {
      e.printInfo();
      loginState.value = LoginState.fail;
      Future.delayed(const Duration(seconds: 1)).then((value) {
        loginState.value = LoginState.idle;
      });
    }
  }

  _afterAuthuenticated(User? user) async {
    var controller = Get.find<UserController>();
    bool isUserExist = await controller.isNewUser(user!.uid);
    if (!isUserExist) {
      await controller.readUserDataById(user.uid);
      Get.offAllNamed(AppRoutes.HOME);
    } else {
      Get.offAllNamed(AppRoutes.GET_USER_INFO, arguments: {'user': user});
    }
  }

  void onAdminLogin() => Get.toNamed(AppRoutes.ADMIN_SIGNIN);
  void onNurseLogin() => Get.toNamed(AppRoutes.NURSE_SIGNIN);
}
