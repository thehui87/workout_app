import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.height,
    this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48.0, // Default height
      width: width ?? double.infinity, // Default to full width
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ??
              Theme.of(context).primaryColor, // Default color
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ??
                BorderRadius.circular(8.0), // Default border radius
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: textColor ?? Colors.white, // Default text color
            fontSize: fontSize ?? 16.0, // Default font size
          ),
        ),
      ),
    );
  }
}
