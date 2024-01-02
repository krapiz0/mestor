import 'package:flutter/material.dart';
import 'package:mestorapp/domain/models/models.dart';

final Map<ActColor, Color> _colorsMap = {
  ActColor.pink: Colors.pink,
  ActColor.red: Colors.red,
  ActColor.orange: Colors.orange,
  ActColor.deepOrange: Colors.deepOrange,
  ActColor.amber: Colors.amber,
  ActColor.yellow: Colors.yellow,
  ActColor.lime: Colors.lime,
  ActColor.lightGreen: Colors.lightGreen,
  ActColor.green: Colors.green,
  ActColor.teal: Colors.teal,
  ActColor.cyan: Colors.cyan,
  ActColor.lightBlue: Colors.lightBlue,
  ActColor.blue: Colors.blue,
  ActColor.indigo: Colors.indigo,
  ActColor.purple: Colors.purple,
  ActColor.deepPurple: Colors.deepPurple,
  ActColor.blueGrey: Colors.blueGrey,
  ActColor.brown: Colors.brown,
  ActColor.grey: Colors.grey,
};

Color getCatColor({required ActColor color}) {
  Color matColor = _colorsMap[color] ?? Colors.grey;
  return matColor;
}
