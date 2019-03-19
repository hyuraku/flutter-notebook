import 'package:flutter/material.dart';

Widget HelloRectangle() {
  return Container(
    color: Colors.greenAccent,
  );
}

void main() {
//  print('Hello');
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Hello rectangle')),
        body: HelloRectangle(),
      )));
}
