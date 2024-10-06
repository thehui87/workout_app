// lib/screens/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/widgets/reusable_bg.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Dashboard'),
      // ),
      body: Center(
        child: ReusableBG(
          content: Column(children: [
            Text('Welcome to the Dashboard!'),
            SvgPicture.asset(
              'images/logo.svg',
              fit: BoxFit.cover, // Make it cover the whole screen
              width: 40,
              height: 40,
            )
          ]),
        ),
      ),
    );
  }
}
