import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/providers/exercise_provider.dart';

void showExerciseDialog(BuildContext context, WidgetRef ref, selectedExercise) {
  final exerciseController = TextEditingController(text: selectedExercise);

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: exerciseController,
                  decoration: InputDecoration(
                    labelText: 'Exercise Name',
                    suffixIcon: exerciseController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              exerciseController
                                  .clear(); // Clear the text field
                              ref
                                  .read(selectedExerciseProvider.notifier)
                                  .clearSelection(); // Clear selected exercise
                              setState(() {}); // Refresh suggestions
                            },
                          )
                        : null,
                  ),
                  onChanged: (value) {
                    setState(() {}); // Rebuild to show updated suggestions
                  },
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView(
                    children: ref
                        .watch(exercisesProvider)
                        .where((exercise) => exercise
                            .toLowerCase()
                            .contains(exerciseController.text.toLowerCase()))
                        .map((exercise) {
                      return ListTile(
                        title: Text(exercise),
                        onTap: () {
                          // Update selectedExercise and close the bottom sheet
                          ref
                              .read(selectedExerciseProvider.notifier)
                              .updateSelection(exercise);
                          exerciseController.text = exercise;
                          Navigator.pop(context);
                        },
                      );
                    }).toList(),
                  ),
                ),
                if (exerciseController.text.isNotEmpty &&
                    !ref.watch(exercisesProvider).any((exercise) =>
                        exercise.toLowerCase() ==
                        exerciseController.text.toLowerCase()))
                  ElevatedButton(
                    onPressed: () {
                      final newExercise = exerciseController.text;
                      ref
                          .read(exercisesProvider.notifier)
                          .addExercise(newExercise);
                      ref
                          .read(selectedExerciseProvider.notifier)
                          .updateSelection(
                              newExercise); // Update selected exercise
                      // print("****** $selectedExercise ******");
                      exerciseController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text('Add New Exercise'),
                  ),
              ],
            );
          },
        ),
      );
    },
  ).whenComplete(() {
    // Reset the exercise controller and selected exercise when the bottom sheet closes
    if (selectedExercise.isEmpty) {
      exerciseController.clear();
    }
  });
}
