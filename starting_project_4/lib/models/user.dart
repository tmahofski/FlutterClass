import 'package:starting_project_4/models/exercise.dart';

class User {
  final String username;
  final String password;

  final List<Exercise> exercises = [
    const Exercise(name: 'Bench Press', bodyPart: 'Chest', currentWeight: '100', sets: '3', reps: '10'),
    const Exercise(name: 'Shoulder Press', bodyPart: 'Shoulder', currentWeight: '100', sets: '3', reps: '10'),
    const Exercise(name: 'Leg Press', bodyPart: 'Legs', currentWeight: '100', sets: '3', reps: '10'),
    const Exercise(name: 'Squat', bodyPart: 'Legs', currentWeight: '100', sets: '3', reps: '10'),
    const Exercise(name: 'Row', bodyPart: 'Back', currentWeight: '100', sets: '3', reps: '10'),
  ];

  User(
    this.username,
    this.password,
  );
}
