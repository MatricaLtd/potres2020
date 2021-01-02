import 'package:flutter/material.dart';
import 'package:potres2020/form.dart';
import 'package:potres2020/main.dart';
import 'package:potres2020/map-page.dart';
import 'package:potres2020/search-page.dart';
import 'package:potres2020/survey.dart';
import 'package:potres2020/table-page.dart';

class SurveyPage extends StatefulWidget {
  @override
  State<SurveyPage> createState() => SurveyPageState();
}

class SurveyPageState extends State<SurveyPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Results>>(
        future: getSurveysData(),
        builder: (context, snapshot) => ListView.builder(
              itemCount: snapshot.data == null ? 0 : snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    child: TextButton(
                  child: Text((index + 1).toString() +
                      ". " +
                      (snapshot.data == null ? "" : snapshot.data[index].name)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchPage(snapshot.data[index].id)));
                  },
                ));
              },
            ));
  }
}
