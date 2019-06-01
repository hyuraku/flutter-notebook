import 'package:flutter/material.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Manage State',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Manage Demo'),
        ),
        body: Center(
          child: Text('Start!'),
        ),
      ),
    );
  }
}
