import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Flutter Demo'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Image.network('https://i.insider.com/5994bc3b38c3fb42008b485d?width=1000&format=jpeg&auto=webp'),
            ),
            Center(
              child: Image.asset('images/universe.jpg'),
            ),
            Row(
              children: [
                const Text(
                  'Text 1',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Text 2',
                  style: TextStyle(fontSize: 25),
                ),
                Material(
                  elevation: 10.0,
                  color: Colors.lightBlueAccent,
                  shadowColor: Colors.black,
                  borderOnForeground: false,
                  borderRadius: BorderRadius.circular(25.0),
                  child: MaterialButton(
                    onPressed: () {
                      print('I tapped a button');
                    },
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 20,
                            child: Icon(Icons.favorite),
                          ),
                        ),
                        Text('Favorite Button'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
