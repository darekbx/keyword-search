import 'package:flutter/material.dart';

class TagWidget extends StatefulWidget {

  TagWidget({Key key, this.tag}) : super(key: key);

  final String tag;

  @override
  State<StatefulWidget> createState() => _TagWidgetState();
}

class _TagWidgetState extends State<TagWidget> {

  int newCount = 0;
  int allCount = 0;
  String stateDebug = "Loading...";

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 8),
        child:
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Text(stateDebug)
            ),
              Row(
                  children: <Widget>[
                    _dataLoaded() ? Text("4/532", style: TextStyle(fontSize: 12),) : _progress(),
                    Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                            "https://stackoverflow.com",
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
        stateDebug = widget.tag;
        allCount = 543;
      });
    }
    );
  }
}