import 'package:finished_project_5/models/exercise.dart';

class User {
  final String username;
  final String password;

  final List<Exercise> exercises = [];

  User(
    this.username,
    this.password,
  );
}
