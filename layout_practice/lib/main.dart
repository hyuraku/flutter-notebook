import 'package:flutter/material.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Flutter Layout memo",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Layout memo"),
        ),
        body: Center(
          child: Text("Hello world"),
        ),
      ),
    );
  }
}