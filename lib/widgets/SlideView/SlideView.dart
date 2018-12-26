import 'package:flutter/material.dart';
import './SlideViewIndicator.dart';

class SlideView extends StatefulWidget {
  var data;
  SlideViewIndicator slideViewIndicator;

  SlideView({
    @required this.data,
    @required this.slideViewIndicator
  });

  @override
  _SlideViewState createState() => _SlideViewState();
}

class _SlideViewState extends State<SlideView> {
  TabController tabController;
  List slideData;

  @override
    void initState() {
      super.initState();
      slideData = this.widget.data;
      tabController = TabController(length: slideData == null ? 0 : slideData.length, vsync: this);
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
    if (this.slideData != null && this.slideData.length > 0) {
      for (var i = 0; i < slideData.length; i++) {
        var item = slideData[i];
        var imgUrl = item['imgUrl'];
        var title = item['title'];
        var detailUrl = item['detailUrl'];
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
