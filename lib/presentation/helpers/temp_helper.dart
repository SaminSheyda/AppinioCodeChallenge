import 'package:flutter/material.dart';

Color getTempColor(int currentTemp) => currentTemp <= 0
    ? Colors.blue
    : currentTemp > 0 && currentTemp <= 15
        ? Colors.indigo
        : currentTemp > 15 && currentTemp < 30
            ? Colors.deepPurple
            : Colors.pink;
