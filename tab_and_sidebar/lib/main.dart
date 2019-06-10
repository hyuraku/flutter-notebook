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

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabs.length, vsync: this);
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
    );
  }

  Widget createTab(Tab tab) {
    return Center(
      child: Text(
        'This is '+ tab.text,
        style: const TextStyle(fontSize: 32.0, color: Colors.lightGreen),
      ),
    );
  }
}
