import 'base_source.dart';
import 'package:keywords_lookup/model/result.dart';

class StackoverflowSource extends BaseSource {

  @override
  String get name => "Stackoverlow";

  @override
  Future<List<Result>> fetchResults(String keyword) {
    return super.fetchResults(keyword);
  }
}