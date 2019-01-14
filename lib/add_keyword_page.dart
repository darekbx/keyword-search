import 'package:flutter/material.dart';
import 'package:keywords_lookup/repository/repository.dart';
import 'model/keyword.dart';

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
          Spacer(),
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

  Future _saveAndPop(BuildContext context) async {

    TODO:
    _repository.save(Keyword(keyword:, sources:  ));

    Navigator.pop(context);
  }
}