import 'package:flutter/material.dart';

class AddKeywordPage extends StatelessWidget {

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
            onPressed: () {})
    );
  }
}