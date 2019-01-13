import 'package:keywords_lookup/model/result.dart';

abstract class BaseSource {

  String get name;

  Future<List<Result>> fetchResults(String keyword) async {}
}