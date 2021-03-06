// @dart=2.9
import 'package:flutter/material.dart';

final deliMealTheme = ThemeData(
  primarySwatch: Colors.pink,
  accentColor: Colors.amber,
  canvasColor: Color.fromRGBO(255, 254, 229, 1),
  fontFamily: 'Raleway',
  textTheme: ThemeData.light().textTheme.copyWith(
        body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
        body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
        title: TextStyle(
          fontSize: 20,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
);
