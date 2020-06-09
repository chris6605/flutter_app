import 'package:flutter/material.dart';
import '../components/MyButton.dart';

class StatusPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StatusPageState();
  }
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text('动态')),
        body: Container(
            alignment: Alignment(0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: FlatButton(
                        onPressed: () {},
                        color: Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                MyButton(
                  width: 300,
                  height: 60,
                  title: 'Logout',
                  color: Colors.red,
                  onPress: () {},
                ),
              ],
            )));
  }
}
