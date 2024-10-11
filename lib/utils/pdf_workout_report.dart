// lib/utils/pdf_table_builder.dart
import 'package:pdf/widgets.dart' as pw;
import 'package:workout_app/utils/pdf_header.dart';
import 'pdf_footer.dart';
import 'package:pdf/widgets.dart' as pdflib;
import 'package:flutter/services.dart'; // For rootBundle

Future<pw.Widget> buildTable(List<Map<String, dynamic>> jsonData) async {
  // Load font
  final ByteData fontData = await rootBundle.load('fonts/DejaVuSans.ttf');
  final pdflib.Font font = pw.Font.ttf(fontData); // Create font from TTF bytes

  final pdfFooterWidget = await pdfFooter();
  final pdfHeaderWidget = await pdfHeader("Workout Report");

  return pw.Column(children: [
    pdfHeaderWidget,
    pw.SizedBox(height: 20),
    pw.Table(border: pw.TableBorder.all(), children: [
      pw.TableRow(children: [
        pw.Padding(
            padding: const pw.EdgeInsets.all(8),
            child: pw.Text('Exercise',
                style:
                    pw.TextStyle(fontWeight: pw.FontWeight.bold, font: font))),
        pw.Padding(
            padding: const pw.EdgeInsets.all(8),
            child: pw.Text('Reps',
                style:
                    pw.TextStyle(fontWeight: pw.FontWeight.bold, font: font))),
        pw.Padding(
            padding: const pw.EdgeInsets.all(8),
            child: pw.Text('Sets',
                style:
                    pw.TextStyle(fontWeight: pw.FontWeight.bold, font: font))),
        pw.Padding(
            padding: const pw.EdgeInsets.all(8),
            child: pw.Text('Duration',
                style:
                    pw.TextStyle(fontWeight: pw.FontWeight.bold, font: font))),
      ]),
      ...jsonData.map((item) {
        return pw.TableRow(children: [
          pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child:
                  pw.Text(item['exercise'], style: pw.TextStyle(font: font))),
          pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text(item['reps'].toString(),
                  style: pw.TextStyle(font: font))),
          pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text(item['sets'].toString(),
                  style: pw.TextStyle(font: font))),
          pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child:
                  pw.Text(item['duration'], style: pw.TextStyle(font: font))),
        ]);
      }),
    ]),
    pdfFooterWidget,
  ]);
}
