import 'package:flutter/material.dart';
import 'package:flutter_osc_clone/utils/NetUtils.dart';
import 'package:flutter_osc_clone/models/HomeDataInfo.dart';
import 'dart:convert';
import 'package:flutter_osc_clone/models/HomeDataInfo.dart';
import 'package:flutter_osc_clone/widgets/SlideView/SlideView.dart';
import 'package:flutter_osc_clone/widgets/SlideView/SlideViewIndicator.dart';

class _NewListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class NewsListPage extends StatefulWidget {
  
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  HomeNewsInfo listInfo;
  List<HomeSlideListInfo> slideList;
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
    indicator = SlideViewIndicator(count: this.slideList.length);
    slideView = SlideView(slideList: this.slideList, slideViewIndicator: indicator);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
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
        }
      },
    );
  }

  getNewsList() {
    const url = 'http://osc.yubo725.top/news/list';
    const params = {'pageIndex': 0, 'pageSize': 10};
    NetUtils.request(url, RequestMethod.get, params).then((result) {
      if (result.isSuccess) {
        int code = result.value['code'];
        if (code == 0) {
          var msg = result.value['msg'];
          List slides = msg['slide'];

          slideList = List<HomeSlideListInfo>();
          slides.forEach((item) {
            var itemInfo = HomeSlideListInfo.fromJson(item);
            slideList.add(itemInfo);
          });
          setState(() {
             initSlider();
          });
        }
      }
    });
  }
}