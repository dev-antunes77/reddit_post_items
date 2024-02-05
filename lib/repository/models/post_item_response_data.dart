import 'package:api_mock/core/models/post_item.dart';
import 'package:api_mock/repository/models/post_item_children.dart';
import 'package:api_mock/repository/models/post_item_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_item_response_data.g.dart';

@JsonSerializable()
final class PostItemResponseData {
  PostItemResponseData({
    this.after,
    this.before,
    required this.children,
  });

  factory PostItemResponseData.fromJson(Map<String, dynamic> json) =>
      _$PostItemResponseDataFromJson(json);
  final String? after;
  final String? before;
  final List<PostItemChildren>? children;

  Map<String, dynamic> toJson() => _$PostItemResponseDataToJson(this);

  List<PostItemDataModel> get postItemData =>
      children?.map((child) => child.data).toList() ?? [];

  List<PostItem> get postItemDataList =>
      postItemData.map((apiData) => apiData.toPostItemDataModel()).toList();
}
