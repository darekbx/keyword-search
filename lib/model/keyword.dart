
class Keyword {

  Keyword({this.id, this.keyword, this.sources, this.lastUpdated});

  int id;
  String keyword;
  List<String> sources;
  int lastUpdated;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "keyword": keyword,
      "sources": sources.join(','),
      "lastUpdated": lastUpdated,
    };
  }

  Keyword.fromMap(Map<String, dynamic> map) {
    id = map["_id"];
    keyword = map["keyword"];
    sources = map["sources"].toString().split(',');
    lastUpdated = map["lastUpdated"];
  }
}