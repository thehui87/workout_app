import 'dart:convert';
import 'package:pdf/widgets.dart' as pw;
import 'pdf_workout_report.dart';
import 'dart:typed_data'; // Add this import

class PdfService {
  // @override
  Future<Uint8List> createPdfFromJson(String jsonString) async {
    // print("json $jsonString");
    // Parse JSON
    final List<dynamic> rawJsonData = json.decode(jsonString);
    final List<Map<String, dynamic>> jsonData =
        List<Map<String, dynamic>>.from(rawJsonData);

    final tableWidget = await buildTable(jsonData);

    // Create PDF
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return tableWidget;
        },
      ),
    );

    // Create PDF bytes
    return await pdf.save();
  }
}
