import 'package:flutter/material.dart';

abstract class Styles {
  static const Color fallbackColor = Colors.grey;
  static const Color badAccent = Colors.red;
  static const Color goodAccent = Colors.green;
  static const Color neutralAccent = Colors.blue;
  static const Map<int, Color> karmaLevelColor = {
    -4: Colors.red,
    -3: Colors.redAccent,
    -2: Colors.orangeAccent,
    -1: Colors.yellowAccent,
    0: Colors.grey,
    1: Colors.limeAccent,
    2: Colors.lightGreenAccent,
    3: Colors.greenAccent,
    4: Colors.cyanAccent,
    5: Colors.lightBlueAccent,
    6: Colors.blueAccent,
    7: Colors.deepPurpleAccent
  };
  static const Color addHabitBackColor = Colors.green;
  static const Color addTaskBackColor = Colors.orange;
}
