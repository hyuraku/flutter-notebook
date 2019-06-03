import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(AnimatedContainerApp());

class AnimatedContainerApp extends StatefulWidget {
  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.greenAccent;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Animation"),
          ),
          body: Center(
            child: AnimatedContainer(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
            ),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.play_circle_filled),
              onPressed: () {
                setState(() {
                  final random = Random();

                  _width = random.nextInt(300).toDouble();
                  _height = random.nextInt(300).toDouble();

                  _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                      random.nextInt(256), 1);

                  _borderRadius =
                      BorderRadius.circular(random.nextInt(100).toDouble());
                });
              }),
        )
    );
  }
}
