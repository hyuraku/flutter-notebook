import 'package:flutter/material.dart';

void main() => runApp(new TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // TodoApp widget itself
    return new MaterialApp(title: 'Todo list', home: new TodoList());
  }
}

class TodoList extends StatefulWidget {
  // create TodoApp state
  @override
  // stateを作成
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  // make an empty list for String type
  List<String> _todoItems = [];

  void _addTodoItem(String task) {
    if (task.length > 0) {
      setState(() => _todoItems.add(task));
    }
  }

  Widget _buildTodoList() {
    return new ListView.builder(
      itemCount: _todoItems.length,
      itemBuilder: (context, index) {
        final item = _todoItems[index];

        return Dismissible(
          // Each Dismissible must contain a Key. Keys allow Flutter to
          // uniquely identify widgets.
          key: Key(item),
          // Provide a function that tells the app
          // what to do after an item has been swiped away.
          onDismissed: (direction) {
            // Remove the item from the data source.
            setState(() {
              _todoItems.removeAt(index);
            });

            // Then show a sPnackbar.
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("$item dismissed")));
          },
          // Show a red background as the item is swiped away.
          background: Container(color: Colors.red),
          child: ListTile(title: Text('$item')),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo List'),
      ),
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _pushAddTodoScreen,
        tooltip: 'Add task',
        child: new Icon(Icons.add),
      ),
    );
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Add a new task'),
        ),
        body: new TextField(
          autofocus: true,
          onSubmitted: (val) {
            _addTodoItem(val);
            Navigator.pop(context);
          },
          decoration: new InputDecoration(
              hintText: 'Emter something to do...',
              contentPadding: const EdgeInsets.all(16.0)),
        ),
      );
    }));
  }
}
