import 'package:flutter/material.dart';
import '../components/MyButton.dart';

class DisCoverPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DiscoverPageState();
  }
}

class _DiscoverPageState extends State<DisCoverPage>
    with SingleTickerProviderStateMixin {
  String title = '';
  bool start = true;
  Animation<double> _tweenAnimation;
  AnimationController _controller;
  CurvedAnimation _curvedAnimation;
  Animation<Offset> _transAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = 'title';
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.linear);
    _tweenAnimation = Tween(begin: 20.0, end: 50.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _transAnimation =
        Tween(begin: Offset.zero, end: Offset(2.0, 0.0)).animate(_controller)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed) {
              _controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _controller.forward();
            }
          });
  }

  handleOnPress() {
    this.setStateFunc();
  }

  setStateFunc() {
    setState(() {
      title = title == 'changed' ? 'title' : 'changed';
    });
  }

  handleAnimate() {
    if (start) {
      _controller.forward();
      start = !start;
    } else {
      start = !start;
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('发现'),
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: this.handleAnimate,
              child: Text('animate'),
            ),
            MyButton(
              color: Colors.yellow,
              width: 130,
              height: 60,
              title: title,
              onPress:()=> this.handleOnPress(),
            ),
            RotationTransition(
              turns: _curvedAnimation,
              child: FlutterLogo(size: 80),
            ),
            FadeTransition(
              opacity: this._curvedAnimation,
              child: FlutterLogo(size: 80),
            ),
            SizeTransition(
                sizeFactor: this._curvedAnimation,
                child: Icon(
                  Icons.favorite,
                  size: 80,
                  color: Colors.red,
                )),
            ScaleTransition(
              scale: this._curvedAnimation,
              child: Icon(
                Icons.flight,
                size: 80,
                color: Colors.pink,
              ),
            ),
            SlideTransition(
              position: this._transAnimation,
              child: Icon(
                Icons.flag,
                size: 80,
                color: Colors.red,
              ),
            ),
            Container(
              width: _tweenAnimation.value,
              height: _tweenAnimation.value,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
