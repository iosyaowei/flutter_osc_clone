import 'package:json_annotation/json_annotation.dart'; 

part 'HomeDataInfo.g.dart';
  
@JsonSerializable()
class HomeNewsInfo {

  @JsonKey(name: 'data')
  List<HomeNewsListInfo> data;

  @JsonKey(name: 'total')
  int total;

  HomeNewsInfo({this.data,this.total});

  factory HomeNewsInfo.fromJson(Map<String, dynamic> json) => _$HomeNewsInfoFromJson(json);
  Map<String, dynamic> toJson() => _$HomeNewsInfoToJson(this);

}

  
@JsonSerializable()
class HomeNewsListInfo {

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'authorImg')
  String authorImg;

  @JsonKey(name: 'commCount')
  int commCount;

  @JsonKey(name: 'detailUrl')
  String detailUrl;

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'newsType')
  String newsType;

  @JsonKey(name: 'summary')
  String summary;

  @JsonKey(name: 'thumb')
  String thumb;

  @JsonKey(name: 'timeStr')
  String timeStr;

  @JsonKey(name: 'title')
  String title;

  HomeNewsListInfo({this.author,this.authorImg,this.commCount,this.detailUrl,this.id,this.newsType,this.summary,this.thumb,this.timeStr,this.title});

  factory HomeNewsListInfo.fromJson(Map<String, dynamic> json) => _$HomeNewsListInfoFromJson(json);
  Map<String, dynamic> toJson() => _$HomeNewsListInfoToJson(this);

}
  
@JsonSerializable()
class HomeSlideListInfo {

  @JsonKey(name: 'detailUrl')
  String detailUrl;

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'imgUrl')
  String imgUrl;

  @JsonKey(name: 'summary')
  String summary;

  @JsonKey(name: 'timeStr')
  String timeStr;

  @JsonKey(name: 'title')
  String title;

  HomeSlideListInfo({this.detailUrl,this.id,this.imgUrl,this.summary,this.timeStr,this.title});

  factory HomeSlideListInfo.fromJson(Map<String, dynamic> json) => _$HomeSlideListInfoFromJson(json);
  Map<String, dynamic> toJson() => _$HomeSlideListInfoToJson(this);


}