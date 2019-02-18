import 'package:keywords_lookup/sources/reddit_source.dart';
import 'package:keywords_lookup/sources/stackoverflow_source.dart';

class Sources {
  static List sources = [
    new StackoverflowSource(),
    new RedditSource()
  ];
}