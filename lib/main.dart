import 'package:flutter/material.dart';
import 'add_keyword_page.dart';
import 'add_source_page.dart';
import 'tag_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keywords lookup',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TagListPage(title: 'Keywords'),
    );
  }
}

class TagListPage extends StatefulWidget {
  TagListPage({Key key, this.title}) : super(key: key);

  final String title;

  final List tags = ["RTT", "Wifi scan", "Round Trip Time"];

  @override
  _TagListPageState createState() => _TagListPageState();
}

class _TagListPageState extends State<TagListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: widget.tags.length,
            itemBuilder: (BuildContext context, int index) {
              return TagWidget(tag: widget.tags[index]);
            }
        ),
        floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                         builder: (context) => AddSourcePage()));
                    },
                    tooltip: 'Add source',
                    heroTag: 'source',
                    child: Icon(Icons.library_add),
                  )
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => AddKeywordPage()));
                },
                tooltip: 'Add keyword',
                heroTag: 'keyword',
                child: Icon(Icons.add),
              )
            ]
        )
    );
  }
}