import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First Flutter App2'),
          // backgroundColor: Colors.blueGrey,
        ),
        backgroundColor: Colors.lightGreen,
        body: Container(
          // color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Image.network('https://i.insider.com/5994bc3b38c3fb42008b485d?width=1000&format=jpeg&auto=webp'),
              ),
              Center(
                // child: ,
                child: Image.asset('images/universe.jpg'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Text 1',
                    style: TextStyle(fontSize: 25),
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
                        print('Hello from button');
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
              )
            ],
          ),
        ),
      ),
    ),
  );
}

class TestClass {
  final String _privateProperty;
  final String publicProp;

  TestClass(this._privateProperty, this.publicProp);

  void _privateMethod() {}

  void publicMethod() {}

  Future<void> getData() async {}
}
