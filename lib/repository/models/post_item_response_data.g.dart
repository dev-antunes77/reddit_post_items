// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_item_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostItemResponseData _$PostItemResponseDataFromJson(
        Map<String, dynamic> json) =>
    PostItemResponseData(
      after: json['after'] as String?,
      before: json['before'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => PostItemChildren.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostItemResponseDataToJson(
        PostItemResponseData instance) =>
    <String, dynamic>{
      'after': instance.after,
      'before': instance.before,
      'children': instance.children,
    };
