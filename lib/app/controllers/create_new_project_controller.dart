import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../data/models/project/project.dart';
import '../ui/global_widgets/bottom_sheet.dart';

class CreateNewProjectController extends GetxController {
  final _projectReference = FirebaseFirestore.instance.collection('projects/6LSE4TXIWadCELz84zvq5B2MBih1/projects');
  final formkey = GlobalKey<FormState>();
  Project? project;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void createNewProject() {
    _projectReference.path.printInfo();
    if (formkey.currentState!.validate()) {
      project = Project(
        userId: FirebaseAuth.instance.currentUser!.uid,
        title: titleController.text,
        description: descriptionController.text,
        active: true,
      );
      _projectReference.doc().set(project!.toDocument()).then((value) {
        Get.bottomSheet(
          const _SuccessfullCreatedSheet(),
          enableDrag: true,
        );
        clearFields();
      });
    }
  }

  clearFields() {
    titleController.clear();
    descriptionController.clear();
  }
}

class _SuccessfullCreatedSheet extends StatelessWidget {
  const _SuccessfullCreatedSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      height: 250,
      child: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Successfully created the project',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: Get.back,
            child: const Text('Close'),
            style: TextButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }
}
