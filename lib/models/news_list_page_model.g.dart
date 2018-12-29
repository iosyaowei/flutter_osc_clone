// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_list_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsListPageModel _$NewsListPageModelFromJson(Map<String, dynamic> json) {
  return NewsListPageModel(
      json['news'] == null
          ? null
          : NewsInfo.fromJson(json['news'] as Map<String, dynamic>),
      (json['slide'] as List)
          ?.map((e) =>
              e == null ? null : Slide.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$NewsListPageModelToJson(NewsListPageModel instance) =>
    <String, dynamic>{'news': instance.news, 'slide': instance.slide};

NewsInfo _$NewsInfoFromJson(Map<String, dynamic> json) {
  return NewsInfo(
      (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : NewsListInfo.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['total'] as int);
}

Map<String, dynamic> _$NewsInfoToJson(NewsInfo instance) =>
    <String, dynamic>{'data': instance.list, 'total': instance.total};

NewsListInfo _$NewsListInfoFromJson(Map<String, dynamic> json) {
  return NewsListInfo(
      json['author'] as String,
      json['authorImg'] as String,
      json['commCount'] as int,
      json['detailUrl'] as String,
      json['id'] as String,
      json['newsType'] as String,
      json['summary'] as String,
      json['thumb'] as String,
      json['timeStr'] as String,
      json['title'] as String);
}

Map<String, dynamic> _$NewsListInfoToJson(NewsListInfo instance) =>
    <String, dynamic>{
      'author': instance.author,
      'authorImg': instance.authorImg,
      'commCount': instance.commCount,
      'detailUrl': instance.detailUrl,
      'id': instance.id,
      'newsType': instance.newsType,
      'summary': instance.summary,
      'thumb': instance.thumb,
      'timeStr': instance.timeStr,
      'title': instance.title
    };

Slide _$SlideFromJson(Map<String, dynamic> json) {
  return Slide(
      json['detailUrl'] as String,
      json['id'] as String,
      json['imgUrl'] as String,
      json['summary'] as String,
      json['timeStr'] as String,
      json['title'] as String);
}

Map<String, dynamic> _$SlideToJson(Slide instance) => <String, dynamic>{
      'detailUrl': instance.detailUrl,
      'id': instance.id,
      'imgUrl': instance.imgUrl,
      'summary': instance.summary,
      'timeStr': instance.timeStr,
      'title': instance.title
    };
