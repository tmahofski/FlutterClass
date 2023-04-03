import 'dart:convert';

import 'package:finished_project_5/models/exercise.dart';
import 'package:http/http.dart';

class ExerciseService {
  ExerciseService({Client? client}) : _client = client ?? Client();

  final Client _client;

  final String _apiKey = 'ed505872f7mshd3208e098f86b94p1b064ejsn3b0e3a29fd68';
  final String _apiHost = 'exercisedb.p.rapidapi.com';

  final String _apiKeyHeader = 'X-RapidAPI-Key';
  final String _apiHostHeader = 'X-RapidAPI-Host';

  List<Exercise>? _cachedExerciseList;

  Future<void> getListOfBodyParts() async {
    String endpoint = 'https://exercisedb.p.rapidapi.com/exercises/bodyPartList';

    Response response = await _client.get(
      Uri.parse(endpoint),
      headers: {
        _apiKeyHeader: _apiKey,
        _apiHostHeader: _apiHost,
      },
    );
  }

  Future<List<Exercise>> getListOfAllExercises() async {
    String endpoint = 'https://exercisedb.p.rapidapi.com/exercises';

    if (_cachedExerciseList != null) {
      return _cachedExerciseList!;
    }

    try {
      Response response = await _client.get(
        Uri.parse(endpoint),
        headers: {
          _apiKeyHeader: _apiKey,
          _apiHostHeader: _apiHost,
        },
      );

      print(response.statusCode);

      List<Exercise> exercises = [];

      List<dynamic> exercisesJson = jsonDecode(response.body);
      int i = 0;
      for (var exerciseJson in exercisesJson) {
        print(i);
        exercises.add(Exercise.fromJson(exerciseJson));
        i++;
      }
      _cachedExerciseList ??= exercises;
      return exercises;
    } on Exception catch (_) {
      return [];
    }
  }
}
