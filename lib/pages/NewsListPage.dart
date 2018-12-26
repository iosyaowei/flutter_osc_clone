import 'package:flutter/material.dart';
import 'package:flutter_osc_clone/utils/NetUtils.dart' show NetUtils;

class _NewListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class NewsListPage extends StatefulWidget {
  var listData;
  var slideData;
  var curPage = 1;
  var listTotalSize = 0;
  ScrollController _controller = ScrollController();

  
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {

  @override
    void initState() {
      super.initState();
      getNewsList();
    }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }

  getNewsList() {
    const url = 'http://osc.yubo725.top/news/list';
    const params = {'pageIndex': 0, 'pageSize': 10};
    NetUtils.request(url, params).then((data){
      if (data.isSuccess) {
        print(data.value);
      }
    });

  }
}