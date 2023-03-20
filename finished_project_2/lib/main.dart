import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math';

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
      home: const DogsPage(),
    );
  }
}

class DogsPage extends StatefulWidget {
  const DogsPage({super.key});

  @override
  State<DogsPage> createState() => _DogsPageState();
}

class _DogsPageState extends State<DogsPage> {
  int imageIndex = 0;

  late Random _random;

  @override
  void initState() {
    super.initState();
    _random = Random();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Dog Image Retriever')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _getCurrentImage(),
          const SizedBox(height: 50),
          CustomMaterialButton(onPressed: _handleButtonPress),
        ],
      ),
    );
  }

  void _handleButtonPress() {
    setState(() {
      imageIndex = _random.nextInt(6) + 1;
    });
  }

  Widget _getCurrentImage() {
    if (imageIndex == 0) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text('Get random dog images'),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: CustomDogImage(imagePath: 'images/image$imageIndex.jpg'),
        ),
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
