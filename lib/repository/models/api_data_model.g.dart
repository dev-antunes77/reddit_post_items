// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiDataModel _$ApiDataModelFromJson(Map<String, dynamic> json) => ApiDataModel(
      author: json['author'] as String?,
      title: json['title'] as String?,
      ups: json['ups'] as int?,
      numComments: json['num_comments'] as int?,
      created: (json['created'] as num?)?.toDouble(),
      createdUtc: (json['createdUtc'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ApiDataModelToJson(ApiDataModel instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'ups': instance.ups,
      'created': instance.created,
      'createdUtc': instance.createdUtc,
      'num_comments': instance.numComments,
    };
