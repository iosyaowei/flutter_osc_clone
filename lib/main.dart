import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'pages/NewsListPage.dart';
import 'pages/DiscoveryPage.dart';
import 'pages/ProfilePage.dart';
import 'pages/TweetsListPage.dart';
import 'pages/DrawSlidePage.dart';
import 'package:flutter_osc_clone/utils/DataUtils.dart';
import 'package:flutter_osc_clone/utils/ThemeUtils.dart';
import 'package:flutter_osc_clone/constants/Constants.dart';
import 'package:flutter_osc_clone/events/ChangeThemeEvent.dart';

void main(){
  runApp(OSCClient());
}

class OSCClient extends StatefulWidget {
  @override
  _OSCClientState createState() => _OSCClientState();
}

class _OSCClientState extends State<OSCClient> {
  Color themeColor = ThemeUtils.currentColorTheme;
  var _tabIndex = 0;
  final tabTextStyleNormal = TextStyle(color:  Color(0xff969696));
  final tabTextStyleSelected = TextStyle(color: Color(0xff63ca6c));

  var tabImages;
  var _body;
  var appBarTitles = ['资讯', '动弹', '发现', '我的'];

  Image getTabImage(path) {
    return Image.asset(path, width:20.0, height:20.0);
  }

  @override
    void initState() {
    super.initState();
      DataUtils.getColorThemeIndex().then((index){
        if (index != null) {
          ThemeUtils.currentColorTheme = ThemeUtils.supportColors[index];
          Constants.eventBus.fire(ChangeThemeEvent(ThemeUtils.supportColors[index]));
        }
      });
    
      Constants.eventBus.on<ChangeThemeEvent>().listen((event){
        setState(() {
          themeColor = event.color;          
        });
      });
    }

    void initData() {
      if(tabImages == null){
        tabImages = [
          [
            getTabImage('assets/images/ic_nav_news_normal.png'),
            getTabImage('assets/images/ic_nav_news_actived.png')
          ],
          [
            getTabImage('assets/images/ic_nav_tweet_normal.png'),
            getTabImage('assets/images/ic_nav_tweet_actived.png')
          ],
          [
            getTabImage('assets/images/ic_nav_discover_normal.png'),
            getTabImage('assets/images/ic_nav_discover_actived.png')
          ],
          [
            getTabImage('assets/images/ic_nav_my_normal.png'),
            getTabImage('assets/images/ic_nav_my_pressed.png')
          ]
        ];
      }

      _body = IndexedStack(
        children: <Widget>[
          NewsListPage(),
          TweetsListPage(),
          DiscoveryPage(),
          ProfilePage()
        ],
        index: _tabIndex,
      );
    }

    TextStyle getTabTextStyle(int curIndex) {
      if (curIndex == _tabIndex) {
        return tabTextStyleSelected;
      }
      return tabTextStyleNormal;
    }

    Image getTabIcon(int curIndex) {
      if (curIndex == _tabIndex) {
        return tabImages[curIndex][1];
      }
      return tabImages[curIndex][0];
    }

    Text getTabTitle(int curIndex) {
      return new Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
    }

  @override
  Widget build(BuildContext context) {
    initData();
    return MaterialApp(
      theme: ThemeData(
        primaryColor: themeColor
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(this.appBarTitles[this._tabIndex], style: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0.0,
        ),
        body: _body,
        bottomNavigationBar: CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
            BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
            BottomNavigationBarItem(icon: getTabIcon(2), title: getTabTitle(2)),
            BottomNavigationBarItem(icon: getTabIcon(3), title: getTabTitle(3)),
          ],
          currentIndex: _tabIndex,
          onTap: (index) {
            setState(() {
                _tabIndex = index;
            });
          },
        ),
        drawer: DrawSlidePage(),
      ),
    );
  }
}