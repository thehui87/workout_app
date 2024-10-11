import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// // State Providers
// final workoutsProvider =
//     StateNotifierProvider<WorkoutsNotifier, List<String>>((ref) {
//   return WorkoutsNotifier();
// });

// class WorkoutsNotifier extends StateNotifier<List<String>> {
//   final List<String> _allWorkouts;
//   // this._allWorkouts
//   WorkoutsNotifier()
//       : _allWorkouts = ['Running', 'Cycling', 'Swimming'],
//         super(['Running', 'Cycling', 'Swimming']); // Initial workouts

//   void addWorkout(String workout) {
//     state = [...state, workout];
//   }

//   void filterWorkouts(String query) {
//     if (query.isEmpty) {
//       state = [];
//       return;
//     }
//     state = _allWorkouts
//         .where((workout) => workout.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//   }
// }

final exercisesProvider =
    StateNotifierProvider<ExercisesNotifier, List<String>>((ref) {
  return ExercisesNotifier();
});

class ExercisesNotifier extends StateNotifier<List<String>> {
  final List<String> _allExercises;
  ExercisesNotifier()
      : _allExercises = ['Running', 'Cycling', 'Swimming'],
        super(['Push-Up', 'Squat', 'Deadlift']); // Initial exercises

  void addExercise(String exercise) {
    state = [...state, exercise];
  }

  void filterExercises(String query) {
    if (query.isEmpty) {
      state = [];
      return;
    }
    state = _allExercises
        .where(
            (exercise) => exercise.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

// Selected Workout Provider
final selectedExerciseProvider =
    StateNotifierProvider<SelectedExerciseNotifier, String>((ref) {
  return SelectedExerciseNotifier();
});

class SelectedExerciseNotifier extends StateNotifier<String> {
  SelectedExerciseNotifier() : super('');

  void updateSelection(String exercise) {
    state = exercise;
  }

  void clearSelection() {
    state = '';
  }
}

final exerciseControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});


// final workoutControllerProvider = StateProvider<TextEditingController>((ref) {
//   return TextEditingController();
// });

// final exerciseControllerProvider = StateProvider<TextEditingController>((ref) {
//   return TextEditingController();
// });

// // Provider for filtering exercises based on user input
// final filteredExercisesProvider =
//     StateNotifierProvider<FilteredExercisesNotifier, List<String>>((ref) {
//   return FilteredExercisesNotifier(ref.watch(exercisesProvider));
// });

// class FilteredExercisesNotifier extends StateNotifier<List<String>> {
//   final List<String> _allExercises;

//   FilteredExercisesNotifier(this._allExercises) : super([]);

//   void filterExercises(String query) {
//     if (query.isEmpty) {
//       state = [];
//       return;
//     }
//     state = _allExercises
//         .where(
//             (exercise) => exercise.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//   }

//   void clearFilter() {
//     state = [];
//   }
// }
