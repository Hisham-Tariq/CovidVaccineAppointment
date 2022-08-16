import 'package:covid_app/app/data/models/vaccine/vaccine.dart';
import 'package:covid_app/app/ui/global_widgets/global_widgets.dart';
import 'package:covid_app/app/ui/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/admin_inventory_controller.dart';

class AdminInventoryPage extends GetView<AdminInventoryController> {
  const AdminInventoryPage({Key? key}) : super(key: key);

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
                        controller: controller.nameController,
                        cursorColor: context.theme.colorScheme.secondary,
                        cursorHeight: 25.0,
                        cursorRadius: const Radius.circular(32.0),
                        cursorWidth: 5,
                        style: context.textTheme.bodyText2!.copyWith(
                          fontSize: 18.0,
                        ),
                        validator: controller.validateVaccine,
                        decoration: const InputDecoration(
                          labelText: 'Vaccine',
                        ),
                      ),
                    ),
                    const HorizontalSpacer(),
                    Expanded(
                      child: TextFormField(
                        controller: controller.qtyController,
                        cursorColor: context.theme.colorScheme.secondary,
                        cursorHeight: 25.0,
                        cursorRadius: const Radius.circular(32.0),
                        cursorWidth: 5,
                        style: context.textTheme.bodyText2!.copyWith(
                          fontSize: 18.0,
                        ),
                        validator: controller.validateVaccine,
                        decoration: const InputDecoration(
                          labelText: 'Quantity',
                        ),
                      ),
                    ),
                    const HorizontalSpacer(),
                  ],
                ),
              ),
            ),
            const VerticalSpacer(),
            TextButton.icon(
              onPressed: controller.addVaccine,
              label: const Text('Add'),
              icon: const Icon(Icons.add),
              style: TextButton.styleFrom(minimumSize: Size(Get.width - 24, 50)),
            ),
            const VerticalSpacer(),
            Center(
              child: Text(
                "Vaccine Types",
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
                child: GetBuilder<AdminInventoryController>(builder: (_) {
                  if (!controller.isDoneFetching) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                          context.theme.colorScheme.secondary,
                        ),
                      ),
                    );
                  } else if (controller.vaccines.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'No Vaccine Added Yet',
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
                    itemCount: controller.vaccines.length,
                    itemBuilder: (context, index) {
                      var vaccine = controller.vaccines[index];
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
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    vaccine.name,
                                    style: Themes.defaultFontFamily.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'Qty: ${vaccine.quantity}',
                                    style: Themes.defaultFontFamily.copyWith(
                                      fontSize: 14,
                                      color: context.theme.brightness == Brightness.light ? Colors.grey.shade700 : Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),
                              const Expanded(child: SizedBox()),
                              IconButton(
                                onPressed: () {
                                  Get.dialog(_UpdateVaccineDialog(vaccine));
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                              ),
                              IconButton(
                                onPressed: () => controller.deleteVaccine(vaccine.id),
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
                            boxShadow: [
                              BoxShadow(
                                // offset: Offset.zero,
                                blurRadius: 5.0,
                                spreadRadius: 5.0,
                                color: context.theme.brightness == Brightness.light ? Colors.grey.shade300 : Colors.grey.shade900,
                              ),
                            ],
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

class _UpdateVaccineDialog extends GetView<AdminInventoryController> {
  const _UpdateVaccineDialog(
    this.vaccine, {
    Key? key,
  }) : super(key: key);

  final Vaccine vaccine;

  @override
  Widget build(BuildContext context) {
    controller.updateNameController.text = vaccine.name;
    controller.updateQtyController.text = vaccine.quantity.toString();
    return Dialog(
      child: SizedBox(
        height: 300,
        width: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Form(
            key: controller.updateFormKey,
            child: Column(
              children: [
                Text(
                  'Update Vaccine',
                  textAlign: TextAlign.center,
                  style: Themes.defaultFontFamily.copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const VerticalSpacer(space: 30),
                TextFormField(
                  controller: controller.updateNameController,
                  cursorColor: context.theme.colorScheme.secondary,
                  cursorHeight: 25.0,
                  cursorRadius: const Radius.circular(32.0),
                  cursorWidth: 5,
                  style: context.textTheme.bodyText2!.copyWith(
                    fontSize: 18.0,
                  ),
                  validator: controller.validateVaccineName,
                  decoration: const InputDecoration(
                    labelText: 'Vaccine',
                  ),
                ),
                const VerticalSpacer(),
                TextFormField(
                  controller: controller.updateQtyController,
                  cursorColor: context.theme.colorScheme.secondary,
                  cursorHeight: 25.0,
                  cursorRadius: const Radius.circular(32.0),
                  cursorWidth: 5,
                  style: context.textTheme.bodyText2!.copyWith(
                    fontSize: 18.0,
                  ),
                  validator: controller.validateVaccineName,
                  decoration: const InputDecoration(
                    labelText: 'Quantity',
                  ),
                ),
                const VerticalSpacer(),
                TextButton(
                  onPressed: () => controller.updateVaccine(vaccine),
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
