import 'package:flutter/material.dart';
import 'package:potres2020/survey-page.dart';
import 'package:potres2020/table-page.dart';

class LaunchPage extends StatefulWidget {
  @override
  State<LaunchPage> createState() => LaunchPageState();
}

class LaunchPageState extends State<LaunchPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextButton(
            child: Text(
              "POTRES 2020 \n KRENIMO!",
              textScaleFactor: 5,
              textAlign: TextAlign.center,
            ),
            onPressed: () => (Navigator.push(context,
                MaterialPageRoute(builder: (context) => TablePage(""))))));
  }
}
