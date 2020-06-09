import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MinePageState();
  }
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: Text(
            '我的',
            style: TextStyle(color: Colors.white, fontSize: 30),
          )),
    );
  }
}
