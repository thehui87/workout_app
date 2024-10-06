import 'package:flutter/material.dart';
import '../models/workout.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;

  const WorkoutCard({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(workout.name),
        subtitle: Text('${workout.exercises.length} exercises'),
        onTap: () {
          // Navigate to workout detail screen
        },
      ),
    );
  }
}
