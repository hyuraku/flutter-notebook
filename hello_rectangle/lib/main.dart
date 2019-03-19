import 'package:flutter/material.dart';

class HelloRectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.amber,
        height: 400.0,
        width: 300.0,
        child: Center(
          child: Text(
              "Hello",
              style: TextStyle(fontSize: 40.0)
          ),
        )
      )
    );
  }
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
