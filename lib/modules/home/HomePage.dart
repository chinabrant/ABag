import 'package:flutter/material.dart';
import 'package:demo02/modules/home/strategy_item_widget.dart';
import 'package:demo02/models/strategy_item.dart';
import 'package:demo02/api/base_api.dart';
import 'dart:async';
import 'package:demo02/modules/ABRouter.dart';
import 'package:fluro/fluro.dart';

class HomePage extends StatefulWidget {


  @override
  State createState() {
    return new HomePageState();
  }
}

/*
* 首页
* */
class HomePageState extends State<HomePage> {

  List<StrategyModel> list = <StrategyModel>[];

  HomePageState() {
    final router = new Router();
    ABRouter.defineRoutes(router);
    ABRouter.router = router;
  }

  @override
  void initState() {
    super.initState();

    _getData();
  }

  // 请求首页数据
  _getData() {
    BaseApi.get().then((map){
      List arr = map['results'];
      for (var i = 0; i < arr.length; i++) {
        StrategyModel model = new StrategyModel.fromMap(arr[i]);
        list.insert(0, model);
      }

      setState((){

      });
    });
  }

  _tapItem(StrategyModel strategyModel) {
    print('点击了标题：${strategyModel.title}');
//    showAlert(strategyModel.title);
    ABRouter.router.navigateTo(context, '/strategy/111');
  }

  // 显示一个 Dialog
  Future<Null> showAlert(String title) async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      child: new AlertDialog(
        title: new Text('标题'),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Text('${title}'),

            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('知道了'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("首页"),
      ),

      body: new Column(
        children: <Widget>[
          new Flexible(
            child: new RefreshIndicator(
                child: new ListView.builder(

                    itemBuilder: (_, int index) => new StrategyItem(model: list[index], onTapStrategy: _tapItem),
                    itemCount: list.length,
                    physics: const AlwaysScrollableScrollPhysics(),

                  ),
                onRefresh: _getData),


          )
        ],
      ),


    );
  }
}