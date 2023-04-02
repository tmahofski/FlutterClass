import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:starting_project_4/models/exercise.dart';
import 'package:starting_project_4/models/user.dart';
import 'package:starting_project_4/views/login_page.dart';

class HomePage extends StatelessWidget {
  static const String route = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;
    String username = user.username;
    List<Exercise> usersExercises = user.exercises;

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
          'Exercise List',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Stack(
        children: [
          _getBackground(context),
          _getScreen(context, username, usersExercises),
        ],
      ),
    );
  }

  Widget _getBackground(BuildContext context) {
    //TODO: Make Better Container
    return Container();
  }

  Widget _getScreen(BuildContext context, String username, List<Exercise> exercises) {
    //TODO: Make Screen Form
    return Container();
  }

  Widget _getExercises(List<Exercise> exercises) {
    //TODO: Make ListView
    return Container();
  }
}
