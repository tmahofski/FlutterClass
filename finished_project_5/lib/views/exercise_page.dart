import 'dart:math';

import 'package:finished_project_5/home_page.dart';
import 'package:finished_project_5/models/exercise.dart';
import 'package:finished_project_5/models/user.dart';
import 'package:finished_project_5/services/exercise_service.dart';
import 'package:finished_project_5/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ExercisePage extends StatefulWidget {
  static const String route = '/exercises';
  const ExercisePage({super.key, required ExerciseService exerciseService}) : _exerciseService = exerciseService;

  final ExerciseService _exerciseService;

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  late final TextEditingController _currentWeightTextEditingController;
  late final TextEditingController _setsTextEditingController;
  late final TextEditingController _repsTextEditingController;

  @override
  void initState() {
    _currentWeightTextEditingController = TextEditingController();
    _setsTextEditingController = TextEditingController();
    _repsTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _currentWeightTextEditingController.dispose();
    _setsTextEditingController.dispose();
    _repsTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(HomePage.route, arguments: user);
          },
        ),
        title: Text(
          'Exercises',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: FutureBuilder<List<Exercise>>(
        future: widget._exerciseService.getListOfAllExercises(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            List<Exercise> exercises = snapshot.data!;

            return ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                Exercise currentExercise = exercises[index];
                return ListTile(
                  leading: Image.network(currentExercise.gifUrl),
                  title: Text(currentExercise.name),
                  onTap: () => _showDialog(context, user, currentExercise),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<void> _showDialog(BuildContext context, User user, Exercise exercise) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${exercise.name} Customization'),
          content: Column(
            children: [
              CustomTextField(
                hintText: 'Current Weight',
                obscureText: false,
                controller: _currentWeightTextEditingController,
              ),
              CustomTextField(
                hintText: 'Sets',
                obscureText: false,
                controller: _setsTextEditingController,
              ),
              CustomTextField(
                hintText: 'Reps',
                obscureText: false,
                controller: _repsTextEditingController,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
                Exercise newExercise = exercise.copyWith(
                  currentWeight: _currentWeightTextEditingController.text,
                  sets: _setsTextEditingController.text,
                  reps: _repsTextEditingController.text,
                );
                user.exercises.add(newExercise);
                Navigator.of(context).popAndPushNamed(HomePage.route, arguments: user);
              },
            ),
          ],
        );
      },
    );
  }
}
