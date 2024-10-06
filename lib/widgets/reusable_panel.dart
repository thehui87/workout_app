import 'package:flutter/material.dart';

class ReusablePanel extends StatelessWidget {
  final String title;
  final Widget content;
  // final Color color;

  const ReusablePanel({
    super.key,
    required this.title,
    required this.content,
    // this.color = Colors.white, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 400, // Set the maximum width
              minWidth: 400,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              // gradient: LinearGradient(
              //   colors: [
              //     Theme.of(context).scaffoldBackgroundColor, // Start color
              //     Theme.of(context).colorScheme.primary, // End color
              //   ],
              //   begin: Alignment.topLeft, // Gradient starts from top-left
              //   end: Alignment.bottomRight, // Gradient ends at bottom-right
              // ),
              borderRadius: BorderRadius.circular(10), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context)
                      .colorScheme
                      .surface
                      .withOpacity(0.5), // Shadow color
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // Position of shadow
                ),
              ],
            ),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 300, // Set the maximum width
                minWidth: 300,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.surface, // Start color
                    Theme.of(context).scaffoldBackgroundColor, // End color
                  ],
                  begin: Alignment.topLeft, // Gradient starts from top-left
                  end: Alignment.bottomRight, // Gradient ends at bottom-right
                ),
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
                child: content,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
