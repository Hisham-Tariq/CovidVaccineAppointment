import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../data/models/user_model/user_model.dart';
import '../routes/app_routes.dart';

class UserController extends GetxController {
  final _usersRef = FirebaseFirestore.instance.collection('users');
  final _user = UserModel.empty().obs;
  UserModel get user => _user.value;
  set user(UserModel user) => _user.value = user;

  String? get currentUserId => FirebaseAuth.instance.currentUser!.uid;

  logout() async {
    await FirebaseAuth.instance.signOut();
    _user.value = UserModel.empty();
    Get.offAllNamed(AppRoutes.SPLASH);
  }

  Future<bool> isNewUser(String id) async =>
      !((await _usersRef.doc(id).get()).exists);

  Future<bool> createNewUser() async {
    await _usersRef.doc(currentUserId).set(user.toDocument());
    return await readUserDataById(currentUserId!);
  }

  Future<bool> readUserDataById(String id) async {
    try {
      _user.value = UserModel.fromDocument((await _usersRef.doc(id).get()));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> readUserDataByEmail(String email) async {
    try {
      _user.value = UserModel.fromDocument(
          (await _usersRef.where('email', isEqualTo: email).get()).docs[0]);
      return true;
    } catch (e) {
      return false;
    }
  }
}
