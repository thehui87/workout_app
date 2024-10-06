import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../providers/workout_provider.dart';
// import '../models/workout.dart';
// import '../widgets/workout_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final workouts = ref.watch(workoutProvider);

    return Scaffold(
      // appBar: AppBar(title: const Text('Workout App')),
      body: Center(child: Text('Welcome Home!')),
      // body: ListView.builder(
      //   itemCount: workouts.length,
      //   itemBuilder: (context, index) {
      //     return WorkoutCard(workout: workouts[index]);
      //   },
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Add functionality to add a new workout
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
