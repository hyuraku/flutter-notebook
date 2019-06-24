import 'package:flutter/material.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: GridView.count(
              crossAxisCount: 2,
              children: List.generate(10, (index) {
                return Center(
                  child: Text(
                    "Item $index",
                    style: Theme.of(context).textTheme.headline,
                  ),
                );
              }))),
    );
  }
}
