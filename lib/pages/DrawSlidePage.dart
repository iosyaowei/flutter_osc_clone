import 'package:flutter/material.dart';

class DrawSlidePage extends StatelessWidget {
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
}