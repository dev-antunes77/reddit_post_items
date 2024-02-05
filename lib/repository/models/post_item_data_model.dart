import 'package:reddit_post_items/core/models/post_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_item_data_model.g.dart';

@JsonSerializable()
final class PostItemDataModel {
  PostItemDataModel({
    required this.author,
    required this.title,
    required this.ups,
    required this.numComments,
    required this.created,
    required this.createdUtc,
  });

  factory PostItemDataModel.fromJson(Map<String, dynamic> json) =>
      _$PostItemDataModelFromJson(json);

  final String? author;
  final String? title;
  final int? ups;
  final double? created;
  final double? createdUtc;
  @JsonKey(name: 'num_comments')
  final int? numComments;

  PostItem toPostItemDataModel() => PostItem(
        title: title ?? '',
        author: author ?? '',
        ups: ups ?? 0,
        numberOfComments: numComments ?? 0,
        createdAt: createdUtc != null
            ? DateTime.fromMillisecondsSinceEpoch(createdUtc!.toInt())
            : DateTime.now(),
      );
}
