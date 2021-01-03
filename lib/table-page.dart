import 'package:flutter/material.dart';
import 'package:potres2020/data.dart';

class TablePage extends StatefulWidget {
  const TablePage(this.search) : super();

  final String search;

  @override
  State<TablePage> createState() => TablePageState();
}

class TablePageState extends State<TablePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
          child: FutureBuilder<List<Features>>(
              future: getData(0, widget.search),
              builder: (context, snapshot) => ListView.builder(
                    itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                              (snapshot.data == null
                                  ? ""
                                  : snapshot.data[index].properties.description
                                          .contains(widget.search)
                                      ? (snapshot.data[index].properties.id
                                              .toString() +
                                          " " +
                                          snapshot
                                              .data[index].properties.title +
                                          ". " +
                                          snapshot.data[index].properties
                                              .description)
                                      : ""),
                              textScaleFactor: 2));
                    },
                  )))
    ]);
  }
}
