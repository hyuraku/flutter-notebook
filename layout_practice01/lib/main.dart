import 'package:flutter/material.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget pictureSection() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 12.5, bottom: 12.0),
              child: Text(
                "Tom adventure",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
            ),
            Image.asset('images/picture.jpg',
                width: 200, height: 300, fit: BoxFit.cover)
          ],
        ),
      );
    }

    Widget upperSection = Container(
      child: Row(
        children: <Widget>[
          Expanded(flex: 5, child: pictureSection()),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _starColumn("Tim"),
          _starColumn("Alan"),
          _starColumn("Liz"),
          _starColumn("John"),
          _starColumn("Jake"),
          _starColumn("Tim"),
          _starColumn("Alan"),
          _starColumn("Liz"),
          _starColumn("John"),
        ],
      ),
    );
  }

  Widget _staffColumn(String label, String name){
    return Column(
      children: <Widget>[

      ],
    );
  }

  Widget _starColumn(String name) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            name,
            style: TextStyle(fontSize: 30.0),
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
