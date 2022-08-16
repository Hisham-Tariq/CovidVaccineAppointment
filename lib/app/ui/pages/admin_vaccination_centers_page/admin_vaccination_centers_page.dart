import 'package:covid_app/app/data/models/vaccination_center/vaccination_center.dart';
import 'package:covid_app/app/ui/global_widgets/spacer.dart';
import 'package:covid_app/app/ui/theme/common_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/admin_vaccination_centers_controller.dart';

class AdminVaccinationCentersPage extends GetView<AdminVaccinationCentersController> {
  const AdminVaccinationCentersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.vaccinationCenterController,
                        cursorColor: context.theme.colorScheme.secondary,
                        cursorHeight: 25.0,
                        cursorRadius: const Radius.circular(32.0),
                        cursorWidth: 5,
                        style: context.textTheme.bodyText2!.copyWith(
                          fontSize: 18.0,
                        ),
                        validator: controller.validateCenter,
                        decoration: const InputDecoration(
                          labelText: 'Vaccination Center',
                        ),
                      ),
                    ),
                    const HorizontalSpacer(),
                    TextButton(
                      onPressed: controller.addVaccinationCenter,
                      child: const Icon(Icons.add),
                      style: TextButton.styleFrom(minimumSize: const Size(90, 70)),
                    ),
                  ],
                ),
              ),
            ),
            const VerticalSpacer(),
            Center(
              child: Text(
                "Vaccination Centers",
                style: Themes.defaultFontFamily.copyWith(
                  fontWeight: FontWeight.w900,
                  fontSize: 28.0,
                ),
              ),
            ),
            const VerticalSpacer(),
            Expanded(
              child: SizedBox(
                width: Get.width,
                child: GetBuilder<AdminVaccinationCentersController>(builder: (_) {
                  if (!controller.isDoneFetching) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                          context.theme.colorScheme.secondary,
                        ),
                      ),
                    );
                  } else if (controller.vaccinationCenters.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'No Centers Added Yet',
                          textAlign: TextAlign.center,
                          style: Themes.defaultFontFamily.copyWith(
                            fontSize: 32.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: controller.vaccinationCenters.length,
                    itemBuilder: (context, index) {
                      var center = controller.vaccinationCenters[index];
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          height: 80,
                          width: Get.width,
                          child: Row(
                            children: [
                              _SerialLabel(index: index + 1),
                              const HorizontalSpacer(space: 16),
                              Text(
                                center.name,
                                style: Themes.defaultFontFamily.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              IconButton(
                                onPressed: () {
                                  Get.dialog(_UpdateCenterDialog(center));
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                              ),
                              IconButton(
                                onPressed: () => controller.deleteVaccineCenter(center.id),
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: context.theme.colorScheme.background,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UpdateCenterDialog extends GetView<AdminVaccinationCentersController> {
  const _UpdateCenterDialog(
    this.center, {
    Key? key,
  }) : super(key: key);

  final VaccinationCenter center;

  @override
  Widget build(BuildContext context) {
    controller.updateCenterController.text = center.name;
    return Dialog(
      child: SizedBox(
        height: 250,
        width: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Form(
            key: controller.updateFormKey,
            child: Column(
              children: [
                Text(
                  'Update Center',
                  textAlign: TextAlign.center,
                  style: Themes.defaultFontFamily.copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const VerticalSpacer(space: 30),
                TextFormField(
                  controller: controller.updateCenterController,
                  cursorColor: context.theme.colorScheme.secondary,
                  cursorHeight: 25.0,
                  cursorRadius: const Radius.circular(32.0),
                  cursorWidth: 5,
                  style: context.textTheme.bodyText2!.copyWith(
                    fontSize: 18.0,
                  ),
                  validator: controller.validateCenter,
                  decoration: const InputDecoration(
                    labelText: 'Vaccination Center',
                  ),
                ),
                const VerticalSpacer(),
                TextButton(
                  onPressed: () => controller.updateVaccinationCenter(center),
                  child: const Text('Update'),
                  style: TextButton.styleFrom(
                    minimumSize: Size(Get.width, 50),
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

class _SerialLabel extends StatelessWidget {
  const _SerialLabel({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 40,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(100000),
      ),
      child: Center(
        child: Text(
          index.toString(),
          style: Themes.defaultFontFamily.copyWith(
            fontSize: 15.0,
            color: context.theme.colorScheme.onSecondary,
          ),
        ),
      ),
    );
  }
}
