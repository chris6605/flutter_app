import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String title;
  final double width;
  final double height;
  final color;
  final onPress;

  MyButton(
      {Key key, this.title, this.width, this.height, this.color, this.onPress})
      : super(key: key);

  @override
  State createState(){
    return _MyButtonState();
  } 
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        child: RaisedButton(
          color: widget.color,
          onPressed:widget.onPress,
          child: Text(widget.title),
        ));
  }
}
