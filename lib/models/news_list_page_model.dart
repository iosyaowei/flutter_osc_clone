import 'package:json_annotation/json_annotation.dart'; 
  
part 'news_list_page_model.g.dart';
  
@JsonSerializable()
  class NewsListPageModel extends Object {

  @JsonKey(name: 'news')
  NewsInfo news;

  @JsonKey(name: 'slide')
  List<Slide> slide;

  NewsListPageModel(this.news,this.slide,);

  factory NewsListPageModel.fromJson(Map<String, dynamic> srcJson) => _$NewsListPageModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewsListPageModelToJson(this);

}

  
@JsonSerializable()
  class NewsInfo extends Object {

  @JsonKey(name: 'data')
  List<NewsListInfo> list;

  @JsonKey(name: 'total')
  int total;

  NewsInfo(this.list,this.total,);

  factory NewsInfo.fromJson(Map<String, dynamic> srcJson) => _$NewsInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewsInfoToJson(this);

}

  
@JsonSerializable()
  class NewsListInfo extends Object {

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

  NewsListInfo(this.author,this.authorImg,this.commCount,this.detailUrl,this.id,this.newsType,this.summary,this.thumb,this.timeStr,this.title,);

  factory NewsListInfo.fromJson(Map<String, dynamic> srcJson) => _$NewsListInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewsListInfoToJson(this);

}

  
@JsonSerializable()
  class Slide extends Object {

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

  Slide(this.detailUrl,this.id,this.imgUrl,this.summary,this.timeStr,this.title,);

  factory Slide.fromJson(Map<String, dynamic> srcJson) => _$SlideFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SlideToJson(this);

}

  
