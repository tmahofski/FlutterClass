import 'package:finished_project_5/models/exercise.dart';
import 'package:finished_project_5/models/user.dart';
import 'package:finished_project_5/services/exercise_service.dart';
import 'package:finished_project_5/views/exercise_page.dart';
import 'package:finished_project_5/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatelessWidget {
  static const String route = '/home';
  const HomePage({super.key, required ExerciseService exerciseService}) : _exerciseService = exerciseService;

  final ExerciseService _exerciseService;

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;
    String username = user.username;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.grey.shade800,
            ),
            onPressed: () {
              Navigator.of(context).popAndPushNamed(LoginPage.route);
            },
          )
        ],
        title: Text(
          'Home',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Stack(
        children: [
          _getBackground(context),
          _getScreen(context, username, user),
        ],
      ),
    );
  }

  Widget _getBackground(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.white,
            Color.fromARGB(255, 224, 224, 224),
          ],
        ),
      ),
    );
  }

  Widget _getScreen(BuildContext context, String username, User user) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '$username\'s exercises',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            _getExercises(user.exercises),
            ElevatedButton(
              onPressed: () async {
                // await _exerciseService.getListOfBodyParts();
                Navigator.of(context).popAndPushNamed(ExercisePage.route, arguments: user);
              },
              child: const Text('Add New Exercise'),
            )
          ],
        ),
      ),
    );
  }

  Widget _getExercises(List<Exercise> exercises) {
    return Expanded(
      child: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          Exercise currentExercise = exercises[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: const Icon(MdiIcons.dumbbell),
                  title: Text(currentExercise.name),
                  subtitle: Text(currentExercise.bodyPart),
                  trailing: const Icon(Icons.chevron_right_sharp),
                  onTap: () {},
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
