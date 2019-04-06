// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:category_route_practice/unit.dart';

const _padding = EdgeInsets.all(16.0);

class ConverterRoute extends StatefulWidget{
  final List<Unit> units;
  final String name;
  final Color color;

  /// This [ConverterRoute] requires the name, color, and units to not be null.
  const ConverterRoute({
    @required this.name,
    @required this.color,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(units != null);

  @override
  _ConverterRoute createState() => _ConverterRoute();
}
class _ConverterRoute extends State<ConverterRoute> {
  Unit _formValue;
  Unit _toValue;
  double _inputValue;
  String _convertValue = '';
  List<DropdownMenuItem> _unitMenuItems;
  bool _showValidationError = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _createDropdownMenuItems(){
    var newItems = <DropdownMenuItem>[];
    for (var unit in widget.units){
      newItems.add(DropdownMenuItem(
          value: unit.name,
          child: Container(
            child: Text(
              unit.name,
              softWrap: true,
            ),
          )
      ));
    }
    setState(() {
      _unitMenuItems = newItems;
    });
  }

  void _setDefaults(){
    setState((){
      _formValue = widget.units[0];
      _toValue = widget.units[1];
    });
  }



  @override
  Widget build(BuildContext context) {
    // Here is just a placeholder for a list of mock units
    final unitWidgets = widget.units.map((Unit unit) {
      return Container(
        color: widget.color,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subhead,
            ),
          ],
        ),
      );
    }).toList();

    return ListView(
      children: unitWidgets,
    );
  }
}
