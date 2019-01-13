import 'package:flutter/material.dart';
import 'add_keyword_page.dart';
import 'sources_page.dart';
import 'keyword_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keywords lookup',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: KeywordListPage(title: 'Keywords'),
    );
  }
}

class KeywordListPage extends StatefulWidget {
  KeywordListPage({Key key, this.title}) : super(key: key);

  final String title;
  final List keywords = ["RTT", "Wifi scan", "Round Trip Time"];

  @override
  _KeywordListPageState createState() => _KeywordListPageState();
}

class _KeywordListPageState extends State<KeywordListPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: widget.keywords.length,
            itemBuilder: (BuildContext context, int index) {
              return KeywordWidget(keyword: widget.keywords[index]);
            }
        ),
        floatingActionButton: _buildFloatingButtons(context)
    );
  }

  Column _buildFloatingButtons(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => SourcesPage()));
                  },
                  tooltip: 'Sources',
                  heroTag: 'sources',
                  child: Icon(Icons.layers),
                )
            ),
            FloatingActionButton(
              onPressed: () => _openAddKeyword(context),
              tooltip: 'Add keyword',
              heroTag: 'keyword',
              child: Icon(Icons.add),
            )
          ]
      );
  }

  void _openAddKeyword(BuildContext context) async {
    var result = await Navigator.push(context, MaterialPageRoute(
        builder: (context) => AddKeywordPage()));


  }
}