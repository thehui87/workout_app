// // pdf_service_web.dart
// import 'dart:typed_data';
// import 'dart:html' as html; // Correctly import html for web
// import 'dart:convert';
// import 'package:flutter/services.dart'; // For rootBundle
// import 'package:pdf/widgets.dart' as pw;
// import 'pdf_service.dart';
// import 'pdf_workout_report.dart';

// class PdfServiceWeb implements PdfService {
//   @override
//   Future<void> createPdfFromJson(String jsonString) async {
//     // Parse JSON
//     final List<dynamic> rawJsonData = json.decode(jsonString);
//     final List<Map<String, dynamic>> jsonData =
//         List<Map<String, dynamic>>.from(rawJsonData);

//     final tableWidget = await buildTable(jsonData);

//     // Create PDF
//     final pdf = pw.Document();
//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) {
//           return tableWidget;
//         },
//       ),
//     );

//     // Save PDF
//     final Uint8List pdfBytes = await pdf.save();

//     // Share PDF
//     final blob = html.Blob([pdfBytes], 'application/pdf');
//     final url = html.Url.createObjectUrlFromBlob(blob);
//     final anchor = html.AnchorElement(href: url)
//       ..setAttribute('download', 'workout_report.pdf')
//       ..click();
//     html.Url.revokeObjectUrl(url);
//   }
// }
