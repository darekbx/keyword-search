import 'package:flutter/material.dart';
import 'package:keywords_lookup/repository/repository.dart';
import 'model/keyword.dart';
import 'package:keywords_lookup/sources/sources.dart';

class AddKeywordPage extends StatelessWidget {

  Repository _repository = Repository();

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
              padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
              child: Text("Select sources to lookup", style: TextStyle(fontSize: 18)),
          ),
          Expanded(child:
          ListView.builder(
            itemCount: Sources.sources.length,
            itemBuilder: (BuildContext context, int index) => _sourceRow(Sources.sources[index].name),
          )
          ),
          _saveButton(context)
        ],
      ),
    );
  }

  Widget _keywordInput() {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child:
        TextField(
            decoration: InputDecoration(
                hintText: "Enter keyword"
            )
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

  Widget _sourceRow(String name) {
    return Padding(
      padding: EdgeInsets.only(left:4, top: 8),
      child: Row(
        children: [
          Checkbox(value: false,),
          Text(name)
        ]
      ),
    );
  }

  Future _saveAndPop(BuildContext context) async {

    TODO:
    //_repository.save(Keyword(keyword:, sources:  ));

    Navigator.pop(context);
  }
}