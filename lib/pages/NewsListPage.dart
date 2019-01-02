import 'package:flutter/material.dart';
import 'package:flutter_osc_clone/utils/NetUtils.dart';
import 'package:flutter_osc_clone/models/news_list_page_model.dart';
import 'package:flutter_osc_clone/widgets/SlideView/SlideView.dart';
import 'package:flutter_osc_clone/widgets/SlideView/SlideViewIndicator.dart';
import '../widgets/CommonEndLine.dart';


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

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Color(0xFF9E9E9E),
          )
        )
      ),
      child: row,
    );
  }
}

class NewsListPage extends StatefulWidget {
  
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  NewsListPageModel pageModel;
  List<NewsListInfo> newsList;

  var curPage = 1;
  var listTotalSize = 0;
  bool isShowNoMoreData = false;
  ScrollController _controller = ScrollController();
  SlideView slideView;
  SlideViewIndicator indicator;

  _NewsListPageState() {
    _controller.addListener((){
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      if (maxScroll == pixels && newsList.length < listTotalSize) {
        //滑动到底部 获取下一页数据
        this.curPage++;
        this.getNewsList(true);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getNewsList(false);
  }

  Future<Null> _pullToRefresh() async {
    curPage = 1;
    getNewsList(false);
    return null;
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
      Widget listView = ListView.builder(
      itemCount: newsList.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Container(
            height: 180.0,
            child: Stack(
              children: <Widget>[
                slideView,              
                Container(
                  alignment: Alignment.bottomCenter,
                  child: indicator,  
                ),
              ],
            ),
          );
        }else {
          var newsItem = newsList[index - 1];
          return _NewListItem(newsInfo: newsItem);
        }
      },
    );

    return RefreshIndicator(child: listView, onRefresh: _pullToRefresh);
    }
  }

  getNewsList(bool isLoadMore) {
    const url = 'http://osc.yubo725.top/news/list';
    Map<String, int> params = {'pageIndex': curPage, 'pageSize': 10};
    NetUtils.request(url, RequestMethod.get, params).then((result) {
      if (result.isSuccess) {
        int code = result.value['code'];
        if (code == 0) {
          var msg = result.value['msg'];

          setState(() {
            this.pageModel = NewsListPageModel.fromJson(msg);
            this.listTotalSize = this.pageModel.news.total;
            if (!isLoadMore) {
              newsList = pageModel.news.list;
            } else {
              newsList.addAll(this.pageModel.news.list);
              this.isShowNoMoreData = newsList.length >= this.listTotalSize;
            }

            initSlider();
          });
        }
      }
    });
  }
}