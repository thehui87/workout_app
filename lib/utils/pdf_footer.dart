// lib/utils/pdf_table_builder.dart
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart'; // For rootBundle
import 'package:pdf/widgets.dart' as pdflib;
import 'package:pdf/pdf.dart';

Future<pw.Widget> pdfFooter() async {
  // Load font
  final ByteData fontData = await rootBundle.load('fonts/DejaVuSans.ttf');
  final pdflib.Font font = pw.Font.ttf(fontData); // Create font from TTF bytes

  // Load logo
  final ByteData logoData = await rootBundle
      .load('assets/images/logo_black.png'); // Change path as necessary
  final Uint8List logoBytes = logoData.buffer.asUint8List();

  return pw.Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: pw.Container(
      padding: const pw.EdgeInsets.all(10),
      margin: const pw.EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.end,
        children: [
          pw.Image(pw.MemoryImage(logoBytes), width: 15),
          pw.SizedBox(width: 10),
          pw.Text('By Dwarf Knight Technologies',
              style: pw.TextStyle(
                fontSize: 10,
                font: font,
                color: PdfColors.grey600,
              )),
        ],
      ),
    ),
  );
}
