import 'package:flutter/material.dart';
import './SlideViewIndicator.dart';
import 'package:flutter_osc_clone/models/HomeDataInfo.dart';
class SlideView extends StatefulWidget {
  List<HomeSlideListInfo> slideList;
  SlideViewIndicator slideViewIndicator;

  SlideView({
    @required this.slideList,
    @required this.slideViewIndicator
  });

  @override
  _SlideViewState createState() => _SlideViewState();
}

class _SlideViewState extends State<SlideView> with SingleTickerProviderStateMixin{
  TabController tabController;
  List<HomeSlideListInfo> slideList;

  @override
  void initState() {
    super.initState();
    slideList = this.widget.slideList;
    tabController = TabController(length: slideList == null ? 0 : slideList.length, vsync: this);
    tabController.addListener((){
      if (this.widget.slideViewIndicator.state.mounted) {
        this.widget.slideViewIndicator.state.setSelectedIndex(this.tabController.index);
      }
    });
  }

  @override
    void dispose() {
    tabController.dispose();
    super.dispose();      
    }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    if (this.slideList != null && this.slideList.length > 0) {
      for (var i = 0; i < slideList.length; i++) {
        var item = slideList[i];
        var imgUrl = item.imgUrl;
        var title = item.title;
        var detailUrl = item.detailUrl;
        items.add(
          GestureDetector(
            onTap: (){

            },
            child: Stack(
              children: <Widget>[
                Image.network(
                  imgUrl,
                  width: MediaQuery.of(context).size.width, fit: BoxFit.contain,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color(0x50000000),
                  child: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        );
      }
    }

    return TabBarView (
      controller: tabController,
      children: items,
    );
  }
}
