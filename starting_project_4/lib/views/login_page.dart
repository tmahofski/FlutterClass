import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:starting_project_4/models/user.dart';
import 'package:starting_project_4/views/home_page.dart';
import 'package:starting_project_4/widgets/custom_elevated_button.dart';
import 'package:starting_project_4/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  static const String route = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //TODO: TextEditingControllers +

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: _getForm(context),
        ),
      ),
    );
  }

  Widget _getForm(BuildContext context) {
    //TODO: Add Login Form
    return Container();
  }

  void _handleLogin() {
    //TODO: Handle Login
  }
}
