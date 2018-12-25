import 'package:flutter/material.dart';

class _DrawSliderItem extends StatelessWidget {
  const _DrawSliderItem({
    @required this.iconPath, 
    @required this.title
  });
  
  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}


class DrawSlidePage extends StatelessWidget {
  // 图标文本前面的图标大小
  static const double IMGAGE_ICON_WIDTH = 30.0;

  //菜单后面的箭头的图标大小
  static const double ARROW_ICON_WIDTH = 16.0;

  var rightArrowIocn = Image.asset(
    'assets/images/ic_arrow_right.png',
    width: ARROW_ICON_WIDTH,
    height: ARROW_ICON_WIDTH,
  );

  List menuTitles = ['发布动弹', '动弹小黑屋', '关于', '设置'];

  List menuIcons = [
    './assets/images/leftmenu/ic_fabu.png',
    './assets/images/leftmenu/ic_xiaoheiwu.png',
    './assets/images/leftmenu/ic_about.png',
    './assets/images/leftmenu/ic_settings.png'
  ];

  //菜单文本样式
  TextStyle menuStyle = TextStyle(
    fontSize: 15.0,
  );

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(width: 304.0),
      child: Material(
        elevation: 16.0,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF)
          ),
        ),
      ),
      );
  }

  Widget getIconImage(path) {
    return Padding(
      padding: EdgeInsets.fromLTRB(2.0, 2.0, 6.0, 0.0),
      child: Image.asset(path, width:28.0, height:28.0),
    );
  }

  Widget renderRow(BuildContext context, int index) {
    if (index == 0) {
      var img = Image.asset('./assets/images/conver_img.jpg', width: 304.0, height: 304.0);
      return Container(
        height: 304.0, 
        width: 304.0, 
        margin: EdgeInsets.only(bottom: 10.0),
        child: img,
      );
    }else {
      index -= 1;

      


    }
  }

}