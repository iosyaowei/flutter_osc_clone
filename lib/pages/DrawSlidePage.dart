import 'package:flutter/material.dart';
import 'package:flutter_osc_clone/constants/Constants.dart' show AppColors, AppSizes;

class _DrawSliderItem extends StatelessWidget {
  const _DrawSliderItem({
    @required this.iconPath, 
    @required this.title,
  });
  
  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(AppColors.DividerColor),
            width: AppSizes.DividerWidth,
          )
        )
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 10.0, 15.0),
            child: Image.asset(
              this.iconPath,
              width:28.0,
              height: 28.0
            ),
          ),
          Expanded(
            child: Text(
              this.title, 
              style: TextStyle(fontSize: 15.0), 
            ),
          ), 
          Image.asset(
            'assets/images/ic_arrow_right.png',
            width: 16.0,
            height: 16.0,
          ),
          SizedBox(width: 10.0),
        ],
      ),
    );
  }
}

class DrawSlidePage extends StatelessWidget {

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
            color: Color(0xFFFFFFFF),
          ),
          child: ListView.builder(
            itemCount: menuTitles.length + 1,
            itemBuilder: renderRow,
          ),
        ),
      ),
      );
  }

  Widget renderRow(BuildContext context, int index) {
    if (index == 0) {
      var img = Image.asset('./assets/images/cover_img.jpg', width: 304.0, height: 304.0);
      return Container(
        height: 304.0, 
        width: 304.0, 
        margin: EdgeInsets.only(bottom: 0.0),
        child: img,
      );
    }else {
      index -= 1;
      return InkWell(
        child:  _DrawSliderItem(
          iconPath: menuIcons[index],
          title: menuTitles[index],
        ),
        onTap: (){
          switch (index) {
            case 0://发布动弹
              print('发布动弹');
              break;
            default:
              print('哈哈哈');
          }
        },
      );
    }
  }
}