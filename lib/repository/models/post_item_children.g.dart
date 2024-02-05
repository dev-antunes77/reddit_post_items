// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_item_children.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostItemChildren _$PostItemChildrenFromJson(Map<String, dynamic> json) =>
    PostItemChildren(
      kind: json['kind'] as String,
      data: PostItemDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostItemChildrenToJson(PostItemChildren instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'data': instance.data,
    };
