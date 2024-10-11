import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// State Providers
final workoutsProvider =
    StateNotifierProvider<WorkoutsNotifier, List<String>>((ref) {
  return WorkoutsNotifier();
});

class WorkoutsNotifier extends StateNotifier<List<String>> {
  final List<String> _allWorkouts;
  // this._allWorkouts
  WorkoutsNotifier()
      : _allWorkouts = ['Running', 'Cycling', 'Swimming'],
        super(['Running', 'Cycling', 'Swimming']); // Initial workouts

  void addWorkout(String workout) {
    state = [...state, workout];
  }

// ref.watch(workoutsProvider)
  void filterWorkouts(String query) {
    if (query.isEmpty) {
      state = [];
      return;
    }
    state = _allWorkouts
        .where((workout) => workout.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

// Selected Workout Provider
final selectedWorkoutProvider =
    StateNotifierProvider<SelectedWorkoutNotifier, String>((ref) {
  return SelectedWorkoutNotifier();
});

class SelectedWorkoutNotifier extends StateNotifier<String> {
  SelectedWorkoutNotifier() : super('');

  void updateSelection(String workout) {
    state = workout;
  }

  void clearSelection() {
    state = '';
  }
}

final workoutControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});
