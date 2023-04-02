import 'package:flutter/material.dart';
import 'package:starting_project_4/views/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          //Todo: Add custom ThemeData
          ),
      initialRoute: LoginPage.route,
      routes: {
        //Todo: Add different routes
        LoginPage.route: (context) => const LoginPage(),
      },
    );
  }
}
