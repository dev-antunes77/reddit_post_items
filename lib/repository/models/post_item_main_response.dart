import 'package:api_mock/repository/models/post_item_response_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_item_main_response.g.dart';

@JsonSerializable()
final class PostItemMainResponse {
  PostItemMainResponse({
    required this.kind,
    required this.data,
  });

  factory PostItemMainResponse.fromJson(Map<String, dynamic> json) =>
      _$PostItemMainResponseFromJson(json);
  final String kind;
  final PostItemResponseData data;

  Map<String, dynamic> toJson() => _$PostItemMainResponseToJson(this);
}
