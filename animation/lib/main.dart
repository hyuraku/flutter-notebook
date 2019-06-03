import 'package:flutter/material.dart';

void main() => runApp(myApp());


class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Animation",
      home: Container(
        child: new AnimatedContainerApp(),
      ),
    );
  }
}

class AnimatedContainerApp extends StatefulWidget{
  @override
  _AnimatedContainerAppState createState => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp>{
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.greenAccent;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}