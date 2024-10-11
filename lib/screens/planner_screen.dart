// lib/screens/dashboard_screen.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_app/models/workout.dart';
import '/widgets/reusable_bg.dart';
// import '../utils/pdf_service_factory.dart';
import '/widgets/clickable_card.dart';
import 'diet_screen.dart';
import 'excercise_screen.dart';
import 'users_screen.dart';
import 'workout_planner_screen.dart';
import 'workouts_screen.dart';
import '/utils/pdf_handler.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class PlannerScreen extends ConsumerWidget {
  // final pdfService = getPdfService();

  const PlannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Dashboard'),
      // ),
      body: Center(
        child: ReusableBG(
          content: SingleChildScrollView(
            child: Column(children: [
              // Text('Welcome to the planner!'),
              // ElevatedButton(
              //   onPressed: () async {
              //     // Example JSON data
              //     String jsonString = json.encode([
              //       {
              //         "exercise": "Push Up",
              //         "reps": 15,
              //         "sets": 3,
              //         "duration": "30 seconds"
              //       },
              //       {
              //         "exercise": "Squat",
              //         "reps": 12,
              //         "sets": 3,
              //         "duration": "30 seconds"
              //       }
              //     ]);
              //     final pdfHandler = PdfHandler();
              //     await pdfHandler.printPdf(jsonString);
              //   },
              //   child: Text('Print PDF'),
              // ),
              // if (!kIsWeb)
              ElevatedButton(
                onPressed: () async {
                  // Example JSON data
                  String jsonString = json.encode([
                    {
                      "exercise": "Push Up",
                      "reps": 15,
                      "sets": 3,
                      "duration": "30 seconds"
                    },
                    {
                      "exercise": "Squat",
                      "reps": 12,
                      "sets": 3,
                      "duration": "30 seconds"
                    }
                  ]);
                  final pdfHandler = PdfHandler();
                  await pdfHandler.sharePdf(jsonString);
                },
                child: Text('Share PDF'),
              ),
              ClickableCard(
                  name: 'Workout planner',
                  imageUrl:
                      'assets/images/icons/Workout_planner_ico.svg', // Example image URL
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WorkoutPlannerScreen()),
                    );
                  }),
              // ClickableCard(
              //     name: 'Workouts',
              //     imageUrl:
              //         'assets/images/icons/Workout_planner_ico.svg', // Example image URL
              //     onTap: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(builder: (context) => WorkoutsScreen()),
              //       );
              //     }),
              ClickableCard(
                  name: 'Exercise',
                  imageUrl:
                      'assets/images/icons/Workout_planner_ico.svg', // Example image URL
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExcerciseScreen()),
                    );
                  }),
              ClickableCard(
                  name: 'Users',
                  imageUrl:
                      'assets/images/icons/Users_ico.svg', // Example image URL
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UsersScreen()),
                    );
                  }),
              ClickableCard(
                  name: 'Diet Plans',
                  imageUrl:
                      'assets/images/icons/Diet_ico.svg', // Example image URL
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DietScreen()),
                    );
                  }),
            ]),
          ),
        ),
      ),
    );
  }
}
