import 'package:flutter/material.dart';
import 'package:keywords_lookup/sources/sources.dart';

class SourcesPage extends StatelessWidget {

  final List sources = Sources.sources;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sources list'),
        ),
        body: ListView.builder(
            itemCount: sources.length,
            itemBuilder: (BuildContext context, int index) {
              return _sourceWidget(sources[index].name);
            }
        )
    );
  }

  Widget _sourceWidget(String name) {
    return
      Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Row(
                      children: [
                        Text(name),

                        // Debug, to remove
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(top: 3.4),
                            child: Text(
                              "TODO: some statistics, api address? ",
                              style: TextStyle(fontSize: 11, color: Colors.redAccent),
                            )
                        )

                      ]
                  )
              ),
              Divider(color: Colors.black38),
            ]),
      );
  }
}