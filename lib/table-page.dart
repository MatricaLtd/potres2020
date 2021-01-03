import 'package:flutter/material.dart';
import 'package:potres2020/posts-data.dart';

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
      Scrollbar(
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: FutureBuilder<List<Results>>(
                  future: getPostsData(),
                  builder: (context, snapshot) => DataTable(
                      dataRowHeight: 100,
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Id',
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Opis',
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Duži opis',
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Telefon',
                          ),
                        ),
                      ],
                      rows: snapshot.data != null
                          ? snapshot.data
                              .map(
                                (e) => DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(e.id.toString())),
                                    DataCell(Container(child: Text(e.title))),
                                    DataCell(Container(child: Text(e.content))),
                                    DataCell(Container(child: Text(e.telefon)))
                                  ],
                                ),
                              )
                              .toList()
                          : List<DataRow>())))),
      Card(
          child: TextFormField(
        decoration: const InputDecoration(
          icon: const Icon(Icons.book_sharp),
          hintText: 'Upišite što tražite',
        ),
      ))
    ]);
  }
}
