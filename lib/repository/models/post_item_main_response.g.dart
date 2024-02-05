// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_item_main_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostItemMainResponse _$PostItemMainResponseFromJson(
        Map<String, dynamic> json) =>
    PostItemMainResponse(
      kind: json['kind'] as String,
      data: PostItemResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostItemMainResponseToJson(
        PostItemMainResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'data': instance.data,
    };
