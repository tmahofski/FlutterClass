import 'dart:math';

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
        primarySwatch: Colors.green,
      ),
      home: const DogPage(),
    );
  }
}

class DogPage extends StatefulWidget {
  const DogPage({super.key});

  @override
  State<DogPage> createState() => _DogPageState();
}

class _DogPageState extends State<DogPage> {
  int _imageIndex = 0;
  late Random _random;

  @override
  void initState() {
    _random = Random();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Dog Images'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _getCurrentImage(),
          CustomMaterialButton(onPressed: _onButtonPressed),
        ],
      ),
    );
  }

  void _onButtonPressed() {
    setState(() {
      _imageIndex = _random.nextInt(6) + 1;
    });
  }

  Widget _getCurrentImage() {
    if (_imageIndex == 0) {
      return const Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Text('Tap Button To See A Dog'),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: CustomDogImage(imagePath: 'images/image$_imageIndex.jpg'),
      );
    }
  }
}

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
