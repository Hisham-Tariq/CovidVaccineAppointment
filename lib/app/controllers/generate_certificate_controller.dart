import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_app/app/controllers/user_controller.dart';
import 'package:covid_app/app/data/models/appointment_model/appointment_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:vector_math/vector_math_64.dart';

class GenerateCertificateController extends GetxController {
  bool isDoneGenerating = false;
  int timesVaccinated = 0;
  File? certificate;
  List<AppointmentModel> vaccinations = [];
  @override
  onInit() async {
    super.onInit();
    vaccinations = (await FirebaseFirestore.instance
            .collection('appointments')
            .where('bookedBy', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .where('status', isEqualTo: 'done')
            .get())
        .docs
        .map((e) {
      return AppointmentModel.fromDocument(e);
    }).toList();
    if (vaccinations.isNotEmpty) {
      timesVaccinated = vaccinations.length;
      certificate = await generateCertificate(PdfPageFormat.a4);
    }
    isDoneGenerating = true;
    update();
  }

  generateCertificate(PdfPageFormat pageFormat) async {
    final lorem = pw.LoremText();
    final pdf = pw.Document();

    final libreBaskerville = await PdfGoogleFonts.libreBaskervilleRegular();
    final libreBaskervilleItalic = await PdfGoogleFonts.libreBaskervilleItalic();
    final libreBaskervilleBold = await PdfGoogleFonts.libreBaskervilleBold();
    final robotoLight = await PdfGoogleFonts.robotoLight();
    final garland = await rootBundle.loadString('assets/svg/garland.svg');
    var user = Get.find<UserController>().user;
    final userName = '${user.firstName} ${user.lastName}';
    final times = user.timesVaccinated;

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          children: [
            pw.Spacer(flex: 2),
            pw.RichText(
              text: pw.TextSpan(
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 25,
                  ),
                  children: const [
                    pw.TextSpan(text: 'Vaccination '),
                    pw.TextSpan(text: 'Certificate'),
                  ]),
            ),
            // pw.Spacer(),
            pw.Text(
              'THIS ACKNOWLEDGES THAT',
              style: pw.TextStyle(
                font: robotoLight,
                fontSize: 10,
                letterSpacing: 2,
                wordSpacing: 2,
              ),
            ),
            pw.SizedBox(
              width: 300,
              child: pw.Divider(color: PdfColors.grey, thickness: 1.5),
            ),
            pw.Text(
              userName,
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontSize: 20,
              ),
            ),
            pw.SizedBox(
              width: 300,
              child: pw.Divider(color: PdfColors.grey, thickness: 1.5),
            ),
            pw.Text(
              'Has been vaccinated for $times times',
              style: pw.TextStyle(
                font: robotoLight,
                fontSize: 10,
                letterSpacing: 2,
                wordSpacing: 2,
              ),
            ),
            pw.SizedBox(height: 10),
            _contentTable(),
            pw.Spacer(),
          ],
        ),
        pageTheme: pw.PageTheme(
          pageFormat: pageFormat,
          theme: pw.ThemeData.withFont(
            base: libreBaskerville,
            italic: libreBaskervilleItalic,
            bold: libreBaskervilleBold,
          ),
          buildBackground: (context) => pw.FullPage(
            ignoreMargins: true,
            child: pw.Container(
              margin: const pw.EdgeInsets.all(10),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: const PdfColor.fromInt(0xffe435), width: 1),
              ),
              child: pw.Container(
                margin: const pw.EdgeInsets.all(5),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: const PdfColor.fromInt(0xffe435), width: 5),
                ),
                width: double.infinity,
                height: double.infinity,
                child: pw.Stack(
                  alignment: pw.Alignment.center,
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(
                        top: 120,
                        left: 80,
                        right: 80,
                        bottom: 80,
                      ),
                      child: pw.SvgImage(
                        svg: garland,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    File certificate = File('/storage/emulated/0/Download/$userName.pdf');
    return certificate.writeAsBytes(await pdf.save());
  }

  pw.Widget _contentTable() {
    const baseColor = PdfColors.yellow;
    const _darkColor = PdfColors.blueGrey800;
    const _lightColor = PdfColors.white;
    var _baseTextColor = baseColor.isLight ? _lightColor : _darkColor;
    var _accentTextColor = baseColor.isLight ? _lightColor : _darkColor;

    const tableHeaders = [
      'Vaccine',
      'Center',
      'Date',
    ];

    return pw.Table.fromTextArray(
      border: null,
      cellAlignment: pw.Alignment.centerLeft,
      headerDecoration: const pw.BoxDecoration(
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(2)),
        color: baseColor,
      ),
      headerHeight: 25,
      cellHeight: 40,
      cellAlignments: {
        1: pw.Alignment.centerLeft,
        2: pw.Alignment.centerRight,
        3: pw.Alignment.center,
      },
      headerStyle: pw.TextStyle(
        color: _baseTextColor,
        fontSize: 10,
        fontWeight: pw.FontWeight.bold,
      ),
      cellStyle: const pw.TextStyle(
        color: _darkColor,
        fontSize: 10,
      ),
      rowDecoration: const pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: PdfColors.blueGrey900,
            width: .5,
          ),
        ),
      ),
      headers: List<String>.generate(
        tableHeaders.length,
        (col) => tableHeaders[col],
      ),
      data: vaccinations.map((e) => [e.vaccinationName, e.centerName, e.appointmentDate]).toList(),
    );
  }
}
