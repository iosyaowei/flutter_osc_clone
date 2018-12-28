// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeDataInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataInfo _$HomeDataInfoFromJson(Map<String, dynamic> json) {
  return HomeDataInfo(
      news: json['news'] == null
          ? null
          : HomeNewsInfo.fromJson(json['news'] as Map<String, dynamic>),
      slide: (json['slide'] as List)
          ?.map((e) => e == null
              ? null
              : HomeSlideListInfo.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$HomeDataInfoToJson(HomeDataInfo instance) =>
    <String, dynamic>{'news': instance.news, 'slide': instance.slide};

HomeNewsInfo _$HomeNewsInfoFromJson(Map<String, dynamic> json) {
  return HomeNewsInfo(
      data: (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : HomeNewsListInfo.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      total: json['total'] as int);
}

Map<String, dynamic> _$HomeNewsInfoToJson(HomeNewsInfo instance) =>
    <String, dynamic>{'data': instance.data, 'total': instance.total};

HomeNewsListInfo _$HomeNewsListInfoFromJson(Map<String, dynamic> json) {
  return HomeNewsListInfo(
      author: json['author'] as String,
      authorImg: json['authorImg'] as String,
      commCount: json['commCount'] as int,
      detailUrl: json['detailUrl'] as String,
      id: json['id'] as String,
      newsType: json['newsType'] as String,
      summary: json['summary'] as String,
      thumb: json['thumb'] as String,
      timeStr: json['timeStr'] as String,
      title: json['title'] as String);
}

Map<String, dynamic> _$HomeNewsListInfoToJson(HomeNewsListInfo instance) =>
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

HomeSlideListInfo _$HomeSlideListInfoFromJson(Map<String, dynamic> json) {
  return HomeSlideListInfo(
      detailUrl: json['detailUrl'] as String,
      id: json['id'] as String,
      imgUrl: json['imgUrl'] as String,
      summary: json['summary'] as String,
      timeStr: json['timeStr'] as String,
      title: json['title'] as String);
}

Map<String, dynamic> _$HomeSlideListInfoToJson(HomeSlideListInfo instance) =>
    <String, dynamic>{
      'detailUrl': instance.detailUrl,
      'id': instance.id,
      'imgUrl': instance.imgUrl,
      'summary': instance.summary,
      'timeStr': instance.timeStr,
      'title': instance.title
    };
