class Workout {
  final String id;
  final String name;
  final String description;
  final List<Exercise> exercises;

  Workout(
      {required this.id,
      required this.name,
      required this.exercises,
      this.description = ''});

  factory Workout.fromJson(Map<String, dynamic> json) {
    var exercisesFromJson = json['exercises'] as List;
    List<Exercise> exerciseList = exercisesFromJson
        .map((exerciseJson) => Exercise.fromJson(exerciseJson))
        .toList();

    return Workout(
      id: json['id'],
      name: json['name'],
      exercises: exerciseList,
    );
  }
}

class Exercise {
  final String name;
  final int duration; // in minutes

  Exercise({required this.name, required this.duration});

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['name'],
      duration: json['duration'],
    );
  }
}
