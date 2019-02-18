import 'package:flutter/material.dart';
import 'package:keywords_lookup/repository/repository.dart';
import 'model/keyword.dart';
import 'package:keywords_lookup/sources/sources.dart';

class Pair {
  Pair(this.name, this.checked);

  String name;
  bool checked;
}

class AddKeywordPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return AddKeywordState();
  }
}

class AddKeywordState extends State<AddKeywordPage> {

  List _sourcesItems = Sources.sources.map((item) => Pair(item.name, false)).toList();
  Repository _repository = Repository();
  final _keywordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new keyword"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _keywordInput(),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
            child: Text(
                "Select sources to lookup",
                style: TextStyle(fontSize: 16, color: Colors.black45)
            ),
          ),
          Expanded(child:
          ListView.builder(
            itemCount: _sourcesItems.length,
            itemBuilder: (BuildContext context, int index) =>
                _sourceRow(_sourcesItems[index]),
          )
          ),
          _saveButton(context)
        ],
      ),
    );
  }

  @override
  void dispose() {
    _keywordController.dispose();
    super.dispose();
  }

  Widget _keywordInput() {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          decoration: InputDecoration(
              hintText: "Enter keyword"
          ),
          controller: _keywordController,
        )
    );
  }

  Widget _saveButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: RaisedButton(
            child: Text("Save"),
            color: Theme
                .of(context)
                .accentColor,
            textColor: Colors.white,
            onPressed: () => _saveAndPop(context)
        )
    );
  }

  Widget _sourceRow(Pair item) {
    return Padding(
      padding: EdgeInsets.only(left: 4, top: 4),
      child: CheckboxListTile(
          value: item.checked,
          title: Text(item.name),
          onChanged: (bool value) {
            setState(() {
              _sourcesItems
                  .firstWhere((i) => i == item)
                  .checked = value;
            });
          }),
    );
  }

  Future _saveAndPop(BuildContext context) async {
    print(_sourcesItems);
    await _repository.save(Keyword(
        keyword: _keywordController.text,
        sources: _sourcesItems
            .where((item) => item.checked)
            .map((item) => item.name.toString())
            .toList()
    ));

    Navigator.pop(context);
  }
}