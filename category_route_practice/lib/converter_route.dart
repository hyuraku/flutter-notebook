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
  Unit _fromValue;
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

  String _format(double conversion){
    var outputNum = conversion.toStringAsPrecision(7);
    if(outputNum.contains('.') && outputNum.endsWith(0)){
      var i = outputNum.length -1 ;
      while(outputNum[i] == '0'){
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1)
    }
    if(outputNum.endsWith('.')){
      return outputNum.substring(0, outputNum.length -1);
    }
    return outputNum;
  }

  void _updateConversion(){
    setState(() {
      _convertValue =
          _format(_inputValue *(_toValue.conversion / _fromValue.conversion));
    });
  }

  void _updateInoutValues(String input){
    setState(() {
      if(input == null || input.isEmpty){
        _convertValue = '';
      }else{
        try{
          final inputDouble = double.parse(input);
          _showValidationError = false;
          _inputValue = inputDouble;
          _updateConversion();
        } on Exception catch(e){
          print('Error: $e');
          _showValidationError = true;
        }
      }
    });
  }

  Unit _getUnit(String unitName){
    return widget.units.firstWhere(
        (Unit unit){
          return unit.name == unitName;
        },
      orElse: null
    );
  }

  void _updateFromConversion(dynamic unitName){
    setState(() {
      _fromValue = _getUnit(unitName);
    });
    if(_inputValue != null){
      _updateConversion();
    }
  }

  void _updateToConversion(dynamic unitName){
    setState(() {
      _toValue = _getUnit(unitName);
    });
    if(_inputValue != null){
      _updateConversion();
    }
  }

  Widget _createDropdown(String currentValue, ValueChanged<dynamic> onChanged){
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border.all(
          color: Colors.grey[400],
          width: 1.0,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.grey[50],
          ),
          child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton(
                  value: currentValue,
                  items: _unitMenuItems,
                  onChanged: onChanged,
                  style: Theme.of(context).textTheme.title,
                )
              ))),
    );
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
