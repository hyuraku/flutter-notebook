import 'package:flutter/material.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Card List",
      home: CardList()
    );
  }
}

class CardList extends StatefulWidget{
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Card list"),
      ),
      body: ListView(
        children: List.generate(10, (index){
          return Center(
            child: Text("Card $index"),
          );
        }),
      ),
    );
  }
}