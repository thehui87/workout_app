// lib/screens/feed_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../providers/workout_provider.dart';
import '/widgets/reusable_bg.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // appBar: AppBar(title: Text('Feed')),
      body: Center(
        child: ReusableBG(content: Text('Feed screen')),
        // body: ListView.builder(
        //   itemCount: workouts.length,
        //   itemBuilder: (context, index) {
        //     final workout = workouts[index];
        //     return ListTile(
        //       title: Text(workout.name),
        //       subtitle: Text(workout.description),
        //     );
        //   },
      ),
    );
  }
}
