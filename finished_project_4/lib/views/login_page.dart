import 'package:finished_project_4/home_page.dart';
import 'package:finished_project_4/models/user.dart';
import 'package:finished_project_4/widgets/custom_elevated_button.dart';
import 'package:finished_project_4/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  static const String route = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  bool _shouldShowError = false;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 350,
          width: MediaQuery.of(context).size.width,
          child: SvgPicture.asset('assets/gym.svg'),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Welcome',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
        CustomTextField(
          hintText: 'Username',
          obscureText: false,
          controller: _usernameController,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          hintText: 'Password',
          obscureText: true,
          controller: _passwordController,
        ),
        const Expanded(
          child: SizedBox(),
        ),
        Opacity(
          opacity: _shouldShowError ? 1 : 0,
          child: Center(
            child: Text(
              'Failed to login',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ),
        CustomElevatedButton(
          text: 'Login',
          onPressed: _handleLogin,
        ),
        const Expanded(
          child: SizedBox(),
        ),
      ],
    );
  }

  void _handleLogin() {
    if (_usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      setState(() {
        _shouldShowError = false;
      });
      String username = _usernameController.text;
      String password = _passwordController.text;
      Navigator.of(context).popAndPushNamed(HomePage.route, arguments: User(username, password));
    } else {
      setState(() {
        _shouldShowError = true;
      });
    }
  }
}
