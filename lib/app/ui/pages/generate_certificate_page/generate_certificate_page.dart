import 'package:covid_app/app/ui/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

import '../../../controllers/generate_certificate_controller.dart';

class GenerateCertificatePage extends GetView<GenerateCertificateController> {
  const GenerateCertificatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GenerateCertificateController>(builder: (_) {
        if (!controller.isDoneGenerating) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation((context.theme.colorScheme.secondary)),
            ),
          );
        } else if (controller.timesVaccinated == 0) {
          return const Center(
            child: Text('You are not vaccinated yet'),
          );
        } else {
          return PDFView(
            filePath: controller.certificate!.path,
          );
        }
      }),
    );
  }
}
