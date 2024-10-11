// lib/screens/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/widgets/reusable_bg.dart';
import '/providers/workout_provider.dart';
import '/providers/exercise_provider.dart';
import '/widgets/show_workout_dialog.dart';
import '/widgets/show_exercise_dialog.dart';

class WorkoutPlannerScreen extends ConsumerStatefulWidget {
  const WorkoutPlannerScreen({super.key});

  @override
  WorkoutPlannerScreenState createState() => WorkoutPlannerScreenState();
}

class WorkoutPlannerScreenState extends ConsumerState<WorkoutPlannerScreen> {
  // const WorkoutPlannerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final selectedWorkout = ref.watch(selectedWorkoutProvider);
    final selectedExercise = ref.watch(selectedExerciseProvider);

    // State variables for additional fields
    final repetitionsController = TextEditingController();
    final weightsController = TextEditingController();
    final restController = TextEditingController();
    final setsController = TextEditingController();

    // Track duration toggle
    bool isTrackingDuration = false;

    String? selectedWeightUnit = 'kgs'; // Default weight unit
    String? selectedRepetitionType = 'Count'; // Default repetition type

    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Planner'),
      ),
      body: Center(
        child: ReusableBG(
          content: Column(children: [
            Text('Welcome to the workout planner board!'),
            SvgPicture.asset(
              'assets/images/logo.svg',
              fit: BoxFit.cover, // Make it cover the whole screen
              width: 40,
              height: 40,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: selectedExercise.isNotEmpty
                            ? EdgeInsets.fromLTRB(0, 8.0, 0, 0)
                            : EdgeInsets.fromLTRB(0, 16.0, 0, 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (selectedWorkout.isNotEmpty)
                                Text('Workout Name',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white)),
                              GestureDetector(
                                onTap: () {
                                  showWorkoutDialog(
                                      context, ref, selectedWorkout);
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: selectedWorkout.isNotEmpty
                                      ? EdgeInsets.fromLTRB(0, 0, 0, 8.0)
                                      : EdgeInsets.fromLTRB(0, 0, 0, 16.0),
                                  decoration: BoxDecoration(
                                    // border: Border.all(color: Colors.grey),
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.5, color: Colors.white),
                                    ),
                                    // borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                      selectedWorkout.isEmpty
                                          ? 'Modify/Add Workout name'
                                          : selectedWorkout,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                ),
                              ),
                            ])),
                    const SizedBox(height: 16),
                    Padding(
                      padding: selectedExercise.isNotEmpty
                          ? EdgeInsets.fromLTRB(0, 8.0, 0, 0)
                          : EdgeInsets.fromLTRB(0, 16.0, 0, 0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (selectedExercise.isNotEmpty)
                              Text('Exercise Name',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white)),
                            GestureDetector(
                              onTap: () {
                                showExerciseDialog(
                                    context, ref, selectedExercise);
                              },
                              child: Container(
                                width: double.infinity,
                                padding: selectedExercise.isNotEmpty
                                    ? EdgeInsets.fromLTRB(0, 0, 0, 8.0)
                                    : EdgeInsets.fromLTRB(0, 0, 0, 16.0),
                                decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.grey),
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.5, color: Colors.white),
                                  ),
                                  // borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                    selectedExercise.isEmpty
                                        ? 'Select/Add Exercise'
                                        : selectedExercise,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(height: 16),

                    // Additional Fields
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: repetitionsController,
                            decoration: const InputDecoration(
                                labelText: 'Repetition Count / Distance (km)'),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              // Split repetitions by commas and set the Sets field accordingly
                              List<String> repetitionValues = value
                                  .split(',')
                                  .map((s) => s.trim())
                                  .toList();
                              if (repetitionValues.isNotEmpty &&
                                  repetitionValues.last.isNotEmpty) {
                                // Only count valid repetitions
                                setsController.text =
                                    repetitionValues.length.toString();
                              } else {
                                setsController.clear();
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        DropdownButton<String>(
                          value: selectedRepetitionType,
                          items: ['Count', 'Time'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            selectedRepetitionType = newValue!;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: weightsController,
                            decoration:
                                const InputDecoration(labelText: 'Weight'),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              // Check for multiple weights
                              List<String> weightValues = value
                                  .split(',')
                                  .map((s) => s.trim())
                                  .toList();
                              final repetitions = repetitionsController.text;
                              List<String> repetitionValues = repetitions
                                  .split(',')
                                  .map((s) => s.trim())
                                  .toList();

                              // If repetition count is 1 and weights count is greater than 1
                              if (repetitionValues.length == 1 &&
                                  weightValues.length > 1) {
                                // Validate weights and set sets accordingly
                                if (weightValues.isNotEmpty &&
                                    weightValues.last.isNotEmpty) {
                                  setsController.text =
                                      weightValues.length.toString();
                                }
                              }

                              // If repetition count is greater than 1 and weights count is also greater than 1
                              if (repetitionValues.length > 1 &&
                                  weightValues.length > 1) {
                                if (repetitionValues.length !=
                                    weightValues.length) {
                                  // Show a warning message
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                          'Warning: Repetition count and weights must match!'),
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        DropdownButton<String>(
                          value: selectedWeightUnit,
                          items: ['kgs', 'lbs'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            selectedWeightUnit = newValue!;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: restController,
                      decoration: const InputDecoration(
                          labelText: 'Rest Time (minutes)'),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: setsController,
                      decoration:
                          const InputDecoration(labelText: 'Sets (number)'),
                      keyboardType: TextInputType.number,
                      enabled: (repetitionsController.text.split(',').length <=
                              1 &&
                          weightsController.text.split(',').length <=
                              1), // Disable if either count is greater than 1
                    ),
                    const SizedBox(height: 16),
                    // Track Duration Toggle
                    SwitchListTile(
                      title: const Text('Track Duration'),
                      value: isTrackingDuration,
                      onChanged: (bool value) {
                        setState(() {
                          isTrackingDuration = !isTrackingDuration;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    // Submit Button
                    ElevatedButton(
                      onPressed: () {
                        // Handle form submission
                        final workoutName = selectedWorkout;
                        final exerciseName = selectedExercise;
                        final repetitions = repetitionsController.text;
                        final weights = weightsController.text;
                        final rest = restController.text;
                        final sets = setsController.text;

                        // Process the data (e.g., save to database or send to an API)
                        print('Workout: $workoutName');
                        print('Exercise: $exerciseName');
                        print('Repetitions: $repetitions');
                        print('Weights: $weights $selectedWeightUnit');
                        print('Rest: $rest minutes');
                        print('Sets: $sets');
                        print('Tracking Duration: $isTrackingDuration');

                        // Clear fields after submission
                        ref
                            .read(selectedWorkoutProvider.notifier)
                            .clearSelection();
                        ref
                            .read(selectedExerciseProvider.notifier)
                            .clearSelection();
                        repetitionsController.clear();
                        weightsController.clear();
                        restController.clear();
                        setsController.clear();
                        isTrackingDuration = false; // Reset toggle
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

// {
//   "workout_template": "",
//   "workout_template_id": "",
//   "workouts":[
//     {
//       "exercise_name": "squats",
//       "exercise_id": "",
//       "repetitions": [],
//       "weights": [],
//       "rest": "3",
//       "sets": 3,
//       "tracking_duration": false,
//     },
//       {
//       "exercise_name": "push-ups",
//       "exercise_id": "",
//       "repetitions": [],
//       "weights": [],
//       "rest": "3",
//       "sets": 3,
//       "tracking_duration": false,
//     },
//   ]
// }