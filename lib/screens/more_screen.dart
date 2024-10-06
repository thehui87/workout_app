// lib/screens/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/widgets/reusable_bg.dart';

class MoreScreen extends ConsumerWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Dashboard'),
      // ),
      body: Center(
        child: ReusableBG(content: Text('Welcome to more screen!')),
      ),
    );
  }
}
