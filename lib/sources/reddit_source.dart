import 'base_source.dart';
import 'package:keywords_lookup/model/result.dart';

class RedditSource extends BaseSource {

  @override
  String get name => "Reddit";

  @override
  Future<List<Result>> fetchResults(String keyword) {
    return super.fetchResults(keyword);
  }
}