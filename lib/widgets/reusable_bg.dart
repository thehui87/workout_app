// widgets/reusable_bg.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReusableBG extends ConsumerWidget {
  // final String title;
  final Widget content;
  // final Color color;

  const ReusableBG({
    super.key,
    // required this.title,
    required this.content,
    // this.color = Colors.white, // Default color
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body:
          // Center(
          //   child:
          Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'images/seamlessbg.jpg',
              ), // Your background image
              // fit: BoxFit.cover, // Cover the entire screen
              fit: BoxFit.scaleDown, // Cover the entire screen
              repeat: ImageRepeat.repeat),
        ),
        child: content,
      ),
      // ),
    );
  }
}
