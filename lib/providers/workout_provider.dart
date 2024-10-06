import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/workout.dart';

final workoutProvider =
    StateNotifierProvider<WorkoutNotifier, List<Workout>>((ref) {
  return WorkoutNotifier();
});

class WorkoutNotifier extends StateNotifier<List<Workout>> {
  WorkoutNotifier() : super([]);

  void addWorkout(Workout workout) {
    state = [...state, workout];
  }
}
