import 'dart:async';

import 'package:flutter/material.dart';
import 'package:potres2020/launch-page.dart';
import 'package:potres2020/map-page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: LaunchPage(),
    );
  }
}

