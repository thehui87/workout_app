import 'package:flutter/material.dart';

// Function to show a global Snackbar
void showGlobalSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: Duration(
        seconds: 3), // Duration for how long the snackbar will be displayed
    action: SnackBarAction(
      label: 'Close',
      onPressed: () {
        // Code to execute when the close button is pressed
      },
    ),
  );

  // Show the snackbar
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
