import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: Container(), //TODO: Set to new dog page
    );
  }
}

//TODO: Make Stateful Dog Page

class CustomMaterialButton extends StatelessWidget {
  final Function() onPressed;
  const CustomMaterialButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 10.0,
        color: Colors.lightBlueAccent,
        shadowColor: Colors.black,
        borderOnForeground: false,
        borderRadius: BorderRadius.circular(25.0),
        child: MaterialButton(
          onPressed: onPressed,
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 20,
                  child: Icon(MdiIcons.dog),
                ),
              ),
              Text('Get Random Dog Image'),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDogImage extends StatelessWidget {
  final String imagePath;
  const CustomDogImage({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Image.asset(imagePath),
    );
  }
}
