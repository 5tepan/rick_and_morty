// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersPage _$CharactersPageFromJson(Map<String, dynamic> json) =>
    CharactersPage(
      info: CharactersPageInfo.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharactersPageToJson(CharactersPage instance) =>
    <String, dynamic>{
      'info': instance.info.toJson(),
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

CharactersPageInfo _$CharactersPageInfoFromJson(Map<String, dynamic> json) =>
    CharactersPageInfo(
      count: (json['count'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$CharactersPageInfoToJson(CharactersPageInfo instance) =>
    <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };
