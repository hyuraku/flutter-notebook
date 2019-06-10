import 'package:flutter/material.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget{
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

class _TabAndSidebar extends State<TabAndSidebar>
    with TickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    Tab(text: "One"),
    Tab(text: "two"),
    Tab(text: "three"),
    Tab(text: "four",),
    Tab(text: "five",)
  ];

  TabController _tabController;

  List _items = <Widget>[];
  String _message;
  int _tapped = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabs.length, vsync: this);

    _message = ' OK';
    for(var i = 0; i < 5; i++){
      var item = ListTile(
        leading: const Icon(Icons.phone_iphone),
        title: Text('No, $i'),
        onTap: (){
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
      body: TabBarView(
          controller: _tabController,
          children: tabs.map((Tab tab) {
            return createTab(tab);
          }).toList()),
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
        'This is '+ tab.text + _message,
        style: const TextStyle(fontSize: 32.0, color: Colors.lightGreen),
      ),
    );
  }

  void tapItem(){
    Navigator.pop(context);
    setState(() {
       _message = ' Tapped: [$_tapped]';
    });
  }
}
