import 'package:flutter/material.dart';
import 'package:flutter_osc_clone/utils/NetUtils.dart';
import 'package:flutter_osc_clone/models/news_list_page_model.dart';
import 'package:flutter_osc_clone/widgets/SlideView/SlideView.dart';
import 'package:flutter_osc_clone/widgets/SlideView/SlideViewIndicator.dart';

class _NewListItem extends StatelessWidget {

  const _NewListItem({Key key, this.newsInfo})
    : assert(newsInfo != null),
    super(key: key);

  final NewsListInfo newsInfo;
  
  @override
  Widget build(BuildContext context) {

    var titleRow = Row(
      children: <Widget>[
        Expanded(
          child: Text(
            newsInfo.title,
            style: TextStyle(fontSize: 15.0),
          ),
        ),
      ],
    );

    var timeRow = Row(
      children: <Widget>[
        Container(
          width: 20.0,
          height: 20.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFECECEC),
            image: DecorationImage(
              image: NetworkImage(newsInfo.authorImg),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Color(0xFFECECEC),
              width: 2.0,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: Text(
            newsInfo.timeStr,
            style: TextStyle(
              color: Color(0xFFB5BDC0),
              fontSize: 12.0
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                newsInfo.commCount.toString(),
                style: TextStyle(
                  color: Color(0xFFB5BDC0),
                  fontSize: 12.0
                 ),
              ),
              Image.asset('./assets/images/ic_comment.png', width:16.0, height:16.0),
            ],
          ),
        )
      ],
    );

    var thumbImg = Container(
      margin: EdgeInsets.all(10),
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFECECEC),
        image: DecorationImage(
          image: ExactAssetImage('./assets/images/ic_img_default.jpg'),
          fit: BoxFit.cover
        ),
        border: Border.all(
          color: Color(0xFFECECEC),
          width: 2.0
        ),
      ),
    );

    if (this.newsInfo.thumb != null && this.newsInfo.thumb.length > 0) {
      thumbImg = Container(
        margin: EdgeInsets.all(10.0),
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFECECEC),
          image: DecorationImage(
            image: NetworkImage(this.newsInfo.thumb),
            fit: BoxFit.cover
          ),
          border: Border.all(
            color: Color(0xFFECECEC),
            width: 2.0,
          )
        ),
      );
    }

    var row = Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                titleRow,
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                  child: timeRow,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(6.0),
          child: Container(
            width: 100.0,
            height: 80.0,
            color: Color(0xFfECECEC),
            child: Center(
              child: thumbImg,
            ),
          ),
        )
      ],
    );

    return row;
  }
}

class NewsListPage extends StatefulWidget {
  
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  NewsListPageModel pageModel;
  var curPage = 1;
  var listTotalSize = 0;
  ScrollController _controller = ScrollController();
  SlideView slideView;
  SlideViewIndicator indicator;
  

  @override
  void initState() {
    super.initState();
    getNewsList();
  }

  initSlider() {
    indicator = SlideViewIndicator(count: pageModel.slide.length);
    slideView = SlideView(slideList: pageModel.slide, slideViewIndicator: indicator);
  }

  @override
  Widget build(BuildContext context) {
    if (pageModel == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }else {
      int count = pageModel.news.list.length + 1;
      print('itemCount =====$count');

      return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          print('当前加载的index ===== $index');
          return Container(
            height: 180.0,
            child: Stack(
              children: <Widget>[
                SlideView(slideList: pageModel.slide, slideViewIndicator: indicator),               Container(
                  alignment: Alignment.bottomCenter,
                  child: indicator,  
                ),
              ],
            ),
          );
        }else {
          print('当前加载的ListView-index ===== $index');
          var newsItem = pageModel.news.list[index - 1];
          return _NewListItem(newsInfo: newsItem);
        }
      },
    );
    }
  }

  getNewsList() {
    const url = 'http://osc.yubo725.top/news/list';
    const params = {'pageIndex': 0, 'pageSize': 10};
    NetUtils.request(url, RequestMethod.get, params).then((result) {
      if (result.isSuccess) {
        int code = result.value['code'];
        if (code == 0) {
          var msg = result.value['msg'];
          pageModel = NewsListPageModel.fromJson(msg);
          print('一共有====' + pageModel.news.list.length.toString());
          setState(() {
             initSlider();
          });
        }
      }
    });
  }
}