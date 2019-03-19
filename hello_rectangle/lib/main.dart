import 'package:flutter/material.dart';

void main() {
//  print('Hello');
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Text('Hello rectangle')
        ),
        body: Container(
          color: Colors.greenAccent,
        ),
      )));
}
