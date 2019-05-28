import 'package:flutter/material.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget upperSection = Container(
      child: Row(
        children: <Widget>[
      Expanded(
        flex: 5,
       child:   Image.asset('images/picture.jpg',
              width: 200, height: 300, fit: BoxFit.fitWidth)),
          Expanded(flex: 5, child: _starColumns())

        ],
      ),
    );

    // TODO: implement build
    return MaterialApp(
      title: "layout practice",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Layout02 Practice"),
        ),
        body: Column(
          children: <Widget>[upperSection, downSection],
        ),
      ),
    );
  }

  Widget _starColumns() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _starColumn("Tim"),
          _starColumn("Alan"),
          _starColumn("Riz"),
          _starColumn("John"),
          _starColumn("Jake")
        ],
      ),
    );
  }

  Widget _starColumn(String name) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            name,
            style: TextStyle(
                fontSize: 30.0
            ),
          ),

        )
      ],
    );
  }

  Widget downSection = Container(
    padding: const EdgeInsets.all(10),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the ',
      softWrap: true,
    ),
  );
}
