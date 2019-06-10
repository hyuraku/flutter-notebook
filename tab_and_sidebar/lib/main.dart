import 'package:flutter/material.dart';
import 'dart:math' show Random;

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Tab and Sidebar",
      home: TabAndSidebar(),
    );
  }
}

class TabAndSidebar extends StatefulWidget {
  @override
  _TabAndSidebar createState() => _TabAndSidebar();
}



var random = new Random();


class _TabAndSidebar extends State<TabAndSidebar>
    with TickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    Tab(text: "One"),
    Tab(text: "two"),
    Tab(text: "three"),
    Tab(
      text: "four",
    ),
    Tab(
      text: "five",
    )
  ];


  var r = random.nextInt(255);
  var g = random.nextInt(255);
  var b = random.nextInt(255);
  TabController _tabController;

  List _items = <Widget>[];
  String _message;
  int _tapped = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabs.length, vsync: this);

    _message = ' OK';
    for (var i = 0; i < 5; i++) {
      var item = ListTile(
        leading: const Icon(Icons.phone_iphone),
        title: Text('No, $i'),
        onTap: () {
          _tapped = i;
          tapItem();
        },
      );
      _items.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement createState
    return Scaffold(
      appBar: AppBar(
        title: Text('MyApp'),
        bottom: TabBar(controller: _tabController, tabs: tabs),
      ),
      body: Container(
        decoration:
            new BoxDecoration(color: Color.fromRGBO(r, g, b, 1.0)),
        child: TabBarView(
            controller: _tabController,
            children: tabs.map((Tab tab) {
              return createTab(tab);
            }).toList()),
      ),
      drawer: Drawer(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: _items,
        ),
      ),
    );
  }

  Widget createTab(Tab tab) {
    return Center(
      child: Text(
        'This is ' + tab.text + _message,
        style: const TextStyle(fontSize: 32.0, color: Colors.black),
      ),
    );
  }

  void tapItem() {
    Navigator.pop(context);
    setState(() {
      _message = ' Tapped: [$_tapped]';
      r = random.nextInt(255);
      g = random.nextInt(255);
      b = random.nextInt(255);   
    });
  }
}
