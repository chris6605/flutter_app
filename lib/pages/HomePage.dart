import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List listData = [];
  ScrollController _scrollController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        loadMore();
      }
    });

    for (int i = 0; i < 10; i++) {
      listData.add('Flutter Demo row data $i');
    }
  }

  Future handleRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        List _refreshData = List.generate(3, (i) => '下拉刷新新增数据${i + 1}');
        listData.insertAll(0, _refreshData);
      });
    });
  }

  Future loadMore() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
          List loadMoreData = List.generate(3, (i) => '上拉加载数据$i');
          listData.addAll(loadMoreData);
        });
      });
    }
  }

  showAlertDialog(context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            content: Text('this is alertdialog'),
            title: Center(
                child: Text(
              '标题',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            )),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'DetailPage');
                  },
                  child: Text('确定')),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('取消')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('首页'),
        ),
        body: RefreshIndicator(
            color: Colors.blue,
            onRefresh: handleRefresh,
            child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  if (index < listData.length) {
                    return renderItem(context, listData[index]);
                  } else {
                    return renderFooter();
                  }
                },
                controller: _scrollController,
                itemCount: listData.length + 1)));
  }

  Widget renderItem(context, item) {
    return GestureDetector(
      onTap: () {
        showAlertDialog(context);
      },
      child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          height: 130,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 120,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: NetworkImage(
                            'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage06.jpg'),
                        fit: BoxFit.cover)),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          child: Text(
                        '$item',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: Text(
                          'content',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget renderFooter() {
    return Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Container(
                padding: EdgeInsets.only(top: 10), child: Text('loading...')),
          ],
        ));
  }
}
