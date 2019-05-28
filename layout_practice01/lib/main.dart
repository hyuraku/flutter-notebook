import 'package:flutter/material.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "layout practice",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Layout02 Practice"),
        ),
        body: Column(
          children: <Widget>[
//            Image.asset(
//              'images/picture.jpg',
//              width: 600,
//              height: 300,
//              fit: BoxFit.cover,
//            ),
//            titleSection,
//            detailSection
            upperSection,
//              downSection
          ],
        ),
      ),
    );
  }

  Widget upperSection = Container(
    child: Row(
      children: <Widget>[
        Image.asset('images/picture.jpg',
            width: 200, height: 300, fit: BoxFit.cover),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 150.0,
        ),
      ],
    ),
  );

  Widget titleSection = Container(
    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
    child: Text(
      'A Empty City',
      style: TextStyle(color: Colors.grey[500], fontSize: 30.0),
    ),
  );
  Widget detailSection = Container(
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
