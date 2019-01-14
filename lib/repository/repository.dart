import 'local/data_provider.dart';
import 'package:keywords_lookup/model/keyword.dart';

class Repository {

  DataProvider _dataProvider = DataProvider();

  Future save(Keyword keyword) async {
    await _dataProvider.save(keyword);
  }

  Future<List<Keyword>> fetch() async => _dataProvider.fetch();
}