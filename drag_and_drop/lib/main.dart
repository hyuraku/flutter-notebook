import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'PressStart'
      ),
      home: ColorGame(),
    );
  }
}

class ColorGame extends StatefulWidget{
  createState() => ColorGameState();
}

class ColorGameState extends State<ColorGame>{
  final Map<String, bool> score = {};

  final Map choices = {
    '🍊': Colors.orangeAccent,
    '🍌': Colors.yellow,
    '🍎': Colors.red,
    '🥝': Colors.lightGreen
  };

  int seed = 0;

  AudioCache _audioController = AudioCache();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Score ${score.length} / ${choices.length}'),
        backgroundColor: Colors.greenAccent,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: (){
            setState(() {
              score.clear();
              seed++;
            });
          }
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: choices.keys.map((word){
              return Draggable<String>(
                data: word,
                child: Word(word: score[word] == true ? '👌' : word),
                feedback: Word(word: word),
                childWhenDragging: Word(word: word),
              );
            }).toList(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
              choices.keys.map((word)=> _buildDragTarget(word)).toList()
                ..shuffle(Random(seed)),
          )
        ],
      ),
    );
  }

  Widget _buildDragTarget(word){
    return DragTarget<String>(
      builder: (BuildContext context,List<String> incoming, List rejected){
        if(score[word] == true){
          return Container(
            color: Colors.white,
            child: Text(
                'Correct!',
                style: TextStyle(color: Colors.cyan, fontSize: 20),
            ),
            alignment: Alignment.center,
            height: 80,
            width: 150,
          );
        }else{
          return Container(
            color: choices[word],
            height: 80,
            width: 150,
          );
        }
      },
      onWillAccept: (data) => data == word,
      onAccept: (data){
        setState(() {
          score[word] = true;
        });
        
        _audioController.play('success.mp3');
      },
      onLeave: (data){

      },
    );
  }
}

class Word extends StatelessWidget{
  Word({Key key, this.word}): super(key: key);

  final String word;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        padding: EdgeInsets.all(10.0),
        child: Text(
          word,
          style: TextStyle(color: Colors.black, fontSize: 50),
        ),

      ),
    );
  }
}




