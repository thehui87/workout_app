import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/providers/workout_provider.dart';

void showWorkoutDialog(
    BuildContext context, WidgetRef ref, String selectedWorkout) {
  final workoutController = TextEditingController(text: selectedWorkout);

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
                  controller: workoutController,
                  decoration: InputDecoration(
                    labelText: 'Workout Name',
                    suffixIcon: workoutController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              workoutController.clear(); // Clear the text field
                              ref
                                  .read(selectedWorkoutProvider.notifier)
                                  .clearSelection(); // Clear selected workout
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
                        .watch(workoutsProvider)
                        .where((workout) => workout
                            .toLowerCase()
                            .contains(workoutController.text.toLowerCase()))
                        .map((workout) {
                      return ListTile(
                        title: Text(workout),
                        onTap: () {
                          // Update selectedWorkout and close the bottom sheet
                          ref
                              .read(selectedWorkoutProvider.notifier)
                              .updateSelection(workout);
                          workoutController.text = workout;
                          Navigator.pop(context);
                        },
                      );
                    }).toList(),
                  ),
                ),
                if (workoutController.text.isNotEmpty &&
                    !ref.watch(workoutsProvider).any((workout) =>
                        workout.toLowerCase() ==
                        workoutController.text.toLowerCase()))
                  ElevatedButton(
                    onPressed: () {
                      final newWorkout = workoutController.text;
                      ref
                          .read(workoutsProvider.notifier)
                          .addWorkout(newWorkout);
                      ref
                          .read(selectedWorkoutProvider.notifier)
                          .updateSelection(
                              newWorkout); // Update selected workout
                      // print("****** $selectedWorkout ******");
                      workoutController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text('Add New Workout'),
                  ),
              ],
            );
          },
        ),
      );
    },
  );
  // .whenComplete(() {
  //   // Reset the workout controller and selected workout when the bottom sheet closes
  //   if (selectedWorkout.isEmpty) {
  //     workoutController.clear();
  //   }
  // });
}
