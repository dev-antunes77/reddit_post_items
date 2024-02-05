import 'package:reddit_post_items/repository/models/post_item_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_item_children.g.dart';

@JsonSerializable()
final class PostItemChildren {
  PostItemChildren({
    required this.kind,
    required this.data,
  });

  factory PostItemChildren.fromJson(Map<String, dynamic> json) =>
      _$PostItemChildrenFromJson(json);
  final String kind;
  final PostItemDataModel data;

  Map<String, dynamic> toJson() => _$PostItemChildrenToJson(this);
}
