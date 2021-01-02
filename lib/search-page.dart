import 'package:flutter/material.dart';
import 'package:potres2020/data.dart';
import 'package:potres2020/survey.dart';
import 'package:potres2020/table-page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage(this.setId) : super();

  final int setId;

  @override
  State<SearchPage> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  TextEditingController controllerSearch = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      
          
      Card(
          child: TextFormField(
              decoration: const InputDecoration(
                  icon: const Icon(Icons.search),
                  hintText: 'Upišite što tražite ...'))),
                  Card(child: TextButton(child: Text("Pretraži>>"), onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TablePage(controllerSearch.text)))))
    ]);
  }
}
