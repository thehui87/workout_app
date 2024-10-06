import 'package:flutter/material.dart';

// HeaderText widget
class HeaderText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;

  const HeaderText(
    this.text, {
    super.key,
    this.fontSize = 16, // Default font size
    this.color, // Default text color
    this.fontWeight = FontWeight.bold, // Default font weight
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color ?? Theme.of(context).colorScheme.onPrimary,
        fontWeight: fontWeight,
      ),
      textAlign: TextAlign.center, // Center align the text
    );
  }
}
