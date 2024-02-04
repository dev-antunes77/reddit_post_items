import 'package:api_mock/core/models/post_item.dart';
import 'package:api_mock/data/post_item_database.dart';
import 'package:api_mock/http_service/http_service.dart';
import 'package:api_mock/repository/models/api_main_response.dart';

final class ApiRepository {
  ApiRepository(this._apiService, this._postItemdatabase);
  final ApiService _apiService;
  final String _apiUrl = 'https://api.reddit.com/r/artificial/hot';
  final PostItemDatabase _postItemdatabase;

  Future<List<PostItem>> getAllPosts() async {
    final response = await Future.wait([
      _apiService.get(_apiUrl),
    ]);

    final apiItems =
        ApiMainResponse.fromJson((response.first).json).data.apiDataList;
    final hiveItems = await _getPostItemsFromHive();
    return [...apiItems] + [...hiveItems];
  }

  Future<List<PostItem>> _getPostItemsFromHive() async =>
      _postItemdatabase.get();

  Future<PostItem> create(PostItem item) async {
    final items = await _postItemdatabase.get();
    final newHiveIndex = items.isEmpty ? 0 : items.length;
    final toCreate = item.copyWith(hiveIndex: newHiveIndex, fromHive: true);
    await _postItemdatabase.create(toCreate);
    return toCreate;
  }

  Future<void> delete(int hiveIndex) => _postItemdatabase.delete(hiveIndex);

  Future<void> update(PostItem item) async => _postItemdatabase.update(item);
}
