import '../../global_widgets/spacer.dart';
import '../../theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/create_new_project_controller.dart';

class CreateNewProjectPage extends GetView<CreateNewProjectController> {
  const CreateNewProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: Get.back,
                    child: Icon(
                      Icons.arrow_back,
                      color: context.theme.colorScheme.onSecondary,
                    ),
                    color: context.theme.colorScheme.secondary,
                    minWidth: 50,
                    // height: 50,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12.0,
                      ),
                    ),
                    // style: TextButton.styleFrom(
                    //   elevation: 0.5,
                    //   // backgroundColor: context.theme.scaffoldBackgroundColor,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(8.0),
                    //   ),
                    //   minimumSize: const Size(50, 50),
                    // ),
                  ),
                  const VerticalSpacer(space: 16.0),
                  Text(
                    'Create A Project',
                    style: Themes.defaultFontFamily.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const VerticalSpacer(space: 24.0),
                  Form(
                    key: controller.formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.titleController,
                          cursorColor: context.theme.colorScheme.secondary,
                          cursorHeight: 25.0,
                          cursorRadius: const Radius.circular(32.0),
                          cursorWidth: 5,
                          style: context.textTheme.bodyText2!.copyWith(
                            fontSize: 18.0,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Title should not be empty';
                            }
                          },
                          decoration: const InputDecoration(
                            labelText: 'Title',
                          ),
                        ),
                        const VerticalSpacer(space: 24.0),
                        TextFormField(
                          controller: controller.descriptionController,
                          cursorColor: context.theme.colorScheme.secondary,
                          cursorHeight: 25.0,
                          cursorRadius: const Radius.circular(32.0),
                          cursorWidth: 5,
                          style: context.textTheme.bodyText2!.copyWith(
                            fontSize: 18.0,
                          ),
                          minLines: 3,
                          maxLines: 5,
                          validator: (value) {},
                          decoration: const InputDecoration(
                            labelText: 'Description',
                          ),
                        ),
                        const VerticalSpacer(space: 24.0),
                        TextButton(
                          onPressed: controller.createNewProject,
                          child: const Text('Create'),
                          style: TextButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
