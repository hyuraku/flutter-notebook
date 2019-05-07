import 'package:flutter/material.dart';

void main() => runApp(new TodoApp());

class TodoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Todo list',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Todo list'),
        ),
      ),
    );
  }
}