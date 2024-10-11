// // pdf_service_mobile.dart
// import 'dart:typed_data';
// import 'dart:io';
// import 'dart:convert';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
// import 'pdf_service.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'pdf_workout_report.dart';

// class PdfServiceMobile implements PdfService {
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
//     final tempDir = await getTemporaryDirectory();
//     final file = File('${tempDir.path}/workout_report.pdf');
//     await file.writeAsBytes(pdfBytes);

//     // Share PDF
//     await Share.shareXFiles([XFile(file.path)], text: 'Here is your PDF');
//   }
// }
