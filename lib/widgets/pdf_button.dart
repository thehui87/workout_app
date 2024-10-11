// pdf_button.dart
import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'dart:typed_data';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:path_provider/path_provider.dart';

class PdfButton extends StatelessWidget {
  final String jsonString;

  const PdfButton({super.key, required this.jsonString});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // PDFUtil.createAndSharePdf(jsonString);
        },
        child: Text('Generate PDF'),
      ),
    );
  }
}
