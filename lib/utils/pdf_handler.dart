import 'dart:typed_data';
import 'package:printing/printing.dart'; // Ensure this import is present
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'pdf_service.dart';
import 'package:pdf/pdf.dart';

class PdfHandler {
  final PdfService pdfService = PdfService();

  Future<void> printPdf(String data) async {
    final pdfBytes = await pdfService.createPdfFromJson(data);

    // Print the PDF
    try {
      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdfBytes,
      );
    } catch (e) {
      print('Error printing PDF: $e');
    }
  }

  Future<void> sharePdf(String data) async {
    final pdfBytes = await pdfService.createPdfFromJson(data);
    // print("pdfBytes $pdfBytes");
    // Share the PDF
    final directory = await getTemporaryDirectory();
    final filePath = '${directory.path}/workout plan.pdf';
    final file = File(filePath);

    await file.writeAsBytes(pdfBytes);
    Share.shareXFiles([XFile(filePath)], text: 'Here is your PDF document!');
  }
}
