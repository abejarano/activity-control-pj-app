import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  final double top;
  final double bottom;
  final double width;
  final Color color;

  const Line(
      {Key? key,
      this.top = 1,
      this.width = 260,
      this.bottom = 1,
        this.color = Colors.white70})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: width,
      margin: EdgeInsets.only(top: top, bottom: bottom),
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}

class VerticalLine extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const VerticalLine(
      {Key? key,
      required this.height,
      this.width = 1,
      this.color = Colors.white70})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      // margin: EdgeInsets.only(top: top),
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}
