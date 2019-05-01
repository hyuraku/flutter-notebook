import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lend and Borrow',
      home: List(),
    );
  }
}

class List extends StatefulWidget {
  @override
  _MyList createState() => _MyList();
}

class _MyList extends State<List> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("リスト画面"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('landb').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return const Text('Loading...');
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                padding: const EdgeInsets.only(top: 10.0),
                itemBuilder: (context, index) =>
                    _buildListItem(context, snapshot.data.documents[index]),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            print("新規作成ボタンを押しました");
            Navigator.push(
                context,
                MaterialPageRoute(
                    settings: const RouteSettings(name: "/new"),
                    builder: (BuildContext context) => InputForm(null)
                )
            );
          }),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.android),
            title: Text("【" +
                (document['borrowOrLend'] == "lend" ? "貸" : "借") +
                "】" +
                document['stuff']),
            subtitle: Text('期限:' +
                document['date'].toString().substring(0, 10) +
                "\n相手:" +
                document['user']),
          ),
          ButtonTheme.bar(
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Icon(Icons.edit),
                  onPressed: () {
                    print("clicked edit button");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          settings: const RouteSettings(name: '/edit'),
                          builder: (BuildContext context) =>
                            InputForm(document)
                      )
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class InputForm extends StatefulWidget {
  InputForm(this.document);
  final DocumentSnapshot document;

  @override
  _MyInputFormState createState() => _MyInputFormState();
}

class _FromData {
  String borrowOrLend = "borrow";
  String user;
  String stuff;
  DateTime date = DateTime.now();
}

class _MyInputFormState extends State<InputForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _FromData _data = _FromData();

  Future<DateTime> _selectTime(BuildContext context) {
    return showDatePicker(
        context: context,
        initialDate: _data.date,
        firstDate: DateTime(_data.date.year - 2),
        lastDate: DateTime(_data.date.year + 2));
  }

  void _setLendOrBorrow(String value) {
    setState(() {
      _data.borrowOrLend = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    DocumentReference _mainReference;
    _mainReference = Firestore.instance.collection('landb').document();
    bool deleteFlg = false;
    if(widget.document != null){
      if(_data.user == null && _data.stuff == null){
        _data.borrowOrLend = widget.document['borrowOrLend'];
        _data.user = widget.document['user'];
        _data.stuff = widget.document['stuff'];
        _data.date = widget.document['date'];
      }
      _mainReference = Firestore.instance.collection('landb').document(widget.document.documentID);
      deleteFlg = true;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Enter the memo'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  print("Clicked save button");
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    _mainReference.setData({
                      'borrowOrLend': _data.borrowOrLend,
                      'user': _data.user,
                      'stuff': _data.stuff,
                      'date': _data.date
                    });
                    Navigator.pop(context);
                  }
                }),
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  print('Clicked delete button');
                  _mainReference.delete();
                  Navigator.pop(context);
                }),
          ],
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              children: <Widget>[
                RadioListTile(
                  value: "borrow",
                  groupValue: _data.borrowOrLend,
                  title: Text("Borrow"),
                  onChanged: (String value) {
                    print('you touch borrow');
                    _setLendOrBorrow(value);
                  },
                ),
                RadioListTile(
                  value: "lend",
                  groupValue: _data.borrowOrLend,
                  title: Text("Lend"),
                  onChanged: (String value) {
                    print('you touch lend');
                    _setLendOrBorrow(value);
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'customer name',
                      labelText: 'Name'),
                  onSaved: (String value){
                    _data.user = value;
                  },
                  validator: (value){
                    if(value.isEmpty){
                      return 'Enter the customer name';
                    }
                  },
                  initialValue: _data.user,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      icon: const Icon(Icons.business_center),
                      hintText: 'something you lend or borrowed',
                      labelText: 'Loan'),
                  onSaved: (String value){
                    _data.stuff = value;
                  },
                  validator: (value){
                    if(value.isEmpty){
                      return 'Enter Stuff name';
                    }
                  },
                  initialValue: _data.stuff,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                      "Due date: ${_data.date.toString().substring(0, 10)}"),
                ),
                RaisedButton(
                  child: const Text("change due date"),
                  onPressed: () {
                    print('touch due date change');
                    _selectTime(context).then((time) {
                      if (time != null && time != _data.date) {
                        setState(() {
                          _data.date = time;
                        });
                      }
                    });
                  },
                )
              ],
            ),
          ),
        ));
  }
}
