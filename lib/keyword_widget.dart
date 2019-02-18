import 'package:flutter/material.dart';
import 'package:keywords_lookup/model/keyword.dart';
import 'package:keywords_lookup/sources/sources.dart';

class KeywordWidget extends StatefulWidget {

  KeywordWidget({Key key, this.keyword}) : super(key: key);

  final List sources = Sources.sources;
  final Keyword keyword;

  @override
  State<StatefulWidget> createState() => _KeywordWidgetState();
}

class _KeywordWidgetState extends State<KeywordWidget> {

  int newCount = 0;
  int allCount = 0;

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 8),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Text(widget.keyword.keyword)
              ),
              Row(
                  children: <Widget>[
                    _dataLoaded() ? Text(
                      "4/532", style: TextStyle(fontSize: 12)) : _progress(),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        widget.keyword.sources.join(', '),
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 12
                        ),
                      ),
                    )
                  ]
              ),
              Divider(color: Colors.black38),
            ]),
      );
  }

  bool _dataLoaded() => allCount > 0;

  Widget _progress() => SizedBox(
      child: CircularProgressIndicator(
        value: null,
        strokeWidth: 3.0,
      ),
      height: 16.0,
      width: 16.0
  );

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        allCount = 543;
      });
    }
    );
  }
}