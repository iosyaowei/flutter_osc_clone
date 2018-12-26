import 'package:flutter/material.dart';

class SlideViewIndicator extends StatefulWidget {

  SlideViewIndicator({
    @required this.count,
  });

  int count;
  int selectedIndex = 0;
  final state = _SlideViewIndicatorState();

  @override
  _SlideViewIndicatorState createState() => this.state;
}

class _SlideViewIndicatorState extends State<SlideViewIndicator> {

  final double dotWidth = 8.0;

  setSelectedIndex(int index) {
    setState(() {
      this.widget.selectedIndex = index;      
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> dots = [];
    for (var i = 0; i < this.widget.count; i++) {
      if(i == this.widget.selectedIndex){ //选中的 dot
        dots.add(
          Container(
            width: dotWidth,
            height: dotWidth,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              shape: BoxShape.circle
            ),
            margin: EdgeInsets.all(8.0),
          )
        );
      } else { //未选中的dot
        dots.add(
          Container(
            width: dotWidth,
            height: dotWidth,
            decoration: BoxDecoration(
              color: Color(0xFF888888),
              shape: BoxShape.circle
            ),
            margin: EdgeInsets.all(8.0),
          )
        );
      }
    }

    return Container(
      height: 30.0,
      color: Color(0x00000000),
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
      child: Center(
        child: Row(
          children: dots,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ), 
    );
  }
}