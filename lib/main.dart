import 'package:flutter/material.dart';
import 'package:potres2020/table-page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Potres 2020.',
      home: TablePage(""),
    );
  }
}

