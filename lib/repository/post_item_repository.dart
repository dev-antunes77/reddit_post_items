import 'package:api_mock/core/models/post_item.dart';
import 'package:api_mock/data/post_item_database.dart';
import 'package:api_mock/http_service/http_service.dart';
import 'package:api_mock/repository/reddit_repository.dart';
import 'package:api_mock/repository/models/post_item_main_response.dart';

final class PostItemRepository implements ApiRepository {
  PostItemRepository(this._apiService, this._postItemdatabase);
  final ApiService _apiService;
  final String _apiUrl = 'https://api.reddit.com/r/artificial/hot';
  final PostItemDatabase _postItemdatabase;

  @override
  Future<List<PostItem>> getAllPosts() async {
    final response = await Future.wait([
      _apiService.get(_apiUrl),
    ]);

    final apiItems = PostItemMainResponse.fromJson((response.first).json)
        .data
        .postItemDataList;
    final hiveItems = await _getPostItemsFromHive();
    return [...apiItems] + [...hiveItems];
  }

  Future<List<PostItem>> _getPostItemsFromHive() async =>
      _postItemdatabase.get();

  @override
  Future<PostItem> create(PostItem item) async {
    final items = await _postItemdatabase.get();
    final newHiveIndex = items.isEmpty ? 0 : items.last.hiveIndex + 1;
    final toCreate = item.copyWith(hiveIndex: newHiveIndex, fromHive: true);
    await _postItemdatabase.create(toCreate);
    return toCreate;
  }

  @override
  Future<void> delete(int hiveIndex) => _postItemdatabase.delete(hiveIndex);

  @override
  Future<void> update(PostItem item) async => _postItemdatabase.update(item);
}
