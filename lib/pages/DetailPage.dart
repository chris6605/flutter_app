import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage> {
  
  popAction(context) {
    Navigator.pop(context);
  }

  renderBody(context) {
    return Container(
        color: Colors.white,
        alignment: Alignment(0, 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 350,
                height: 50,
                color: Colors.red,
                child: FlatButton(
                    onPressed: () => popAction(context), child: Text('Pop')),
              )
            ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('发现'),
        ),
        body: renderBody(context));
  }
}
