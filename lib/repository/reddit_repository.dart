import 'package:reddit_post_items/core/models/post_item.dart';

abstract interface class ApiRepository {
  Future<List<PostItem>> getAllPosts();
  Future<PostItem> create(PostItem postItem);
  Future<void> update(PostItem postItem);
  Future<void> delete(int hiveIndex);
}
