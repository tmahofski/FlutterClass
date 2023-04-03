import 'dart:math';

import 'package:finished_project_5/home_page.dart';
import 'package:finished_project_5/services/exercise_service.dart';
import 'package:finished_project_5/views/exercise_page.dart';
import 'package:finished_project_5/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  ExerciseService exerciseService = ExerciseService();
  runApp(App(
    exerciseService: exerciseService,
  ));
}

class App extends StatelessWidget {
  const App({super.key, required ExerciseService exerciseService}) : _exerciseService = exerciseService;

  final ExerciseService _exerciseService;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.encodeSans(
            fontSize: 36,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: GoogleFonts.encodeSans(
            fontSize: 25,
            color: Colors.grey.shade800,
          ),
          headlineSmall: GoogleFonts.encodeSans(
            fontSize: 12,
            color: Colors.grey.shade800,
          ),
          bodySmall: GoogleFonts.encodeSans(
            fontSize: 12,
            color: Colors.grey.shade700,
          ),
          labelSmall: GoogleFonts.encodeSans(
            fontSize: 12,
            color: Colors.red,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(0, 50),
              shape: const StadiumBorder(),
              textStyle: GoogleFonts.encodeSans(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              )),
        ),
      ),
      // themeMode: ThemeMode.dark,
      initialRoute: LoginPage.route,
      routes: {
        LoginPage.route: (context) => const LoginPage(),
        HomePage.route: (context) => HomePage(
              exerciseService: _exerciseService,
            ),
        ExercisePage.route: (context) => ExercisePage(
              exerciseService: _exerciseService,
            ),
      },
    );
  }
}
