import 'package:flutter/material.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(title: "Card List", home: CardList());
  }
}

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Card list"),
      ),
      body: ListView(
        children: List.generate(10, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NextScreen()));
            },
            child: Card(
              child: Column(
                children: <Widget>[
                  Image.network("https://picsum.photos/240/150"),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Text("Cart$index"),
                      leading: Icon(Icons.person),
                      subtitle: Text("SubTitle"),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Material App"),
        ),
        body: Center(
          child: Text("画面遷移できました"),
        ));
  }
}
