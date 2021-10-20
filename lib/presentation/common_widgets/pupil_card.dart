import 'package:boobook/core/models/pupil.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PupilCard {
  static Future<Page> generate(
    Pupil pupil, {
    required String title,
    required String subtitle,
  }) async {
    final background = MemoryImage(
      (await rootBundle.load("assets/images/card.png")).buffer.asUint8List(),
    );

    MemoryImage? avatar;

    if (pupil.photoUrl != null) {
      avatar =
          MemoryImage((await http.get(Uri.parse(pupil.photoUrl!))).bodyBytes);
    }

    return Page(
      pageFormat: PdfPageFormat(325, 204),
      build: (Context context) {
        return Stack(
          alignment: Alignment.topLeft,
          children: [
            Image(background),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: PdfColor(82 / 255, 132 / 255, 48 / 255),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 10),
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50, left: 140),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: avatar != null
                          ? Image(avatar, width: 70, height: 70)
                          : SizedBox.shrink(),
                    ),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Text(pupil.displayName),
                  ),
                  SizedBox(height: 22),
                  BarcodeWidget(
                    barcode: Barcode.code128(),
                    data: pupil.id!,
                    width: 150,
                    height: 30,
                    drawText: false,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
