import 'package:flutter/material.dart';
import 'package:demo02/models/strategy_item.dart';

typedef void ClickStrategyCallback(StrategyModel strategyModel);

class StrategyItem extends StatelessWidget {

  StrategyItem({this.model, this.onTapStrategy});

  final StrategyModel model;

  final ClickStrategyCallback onTapStrategy;

  _tapStrategy() {
    onTapStrategy(model);
  }

  @override
  Widget build(BuildContext context) {
    // 顶部的用户头像和用户名，用户签名
    var topSection = new Container(
      height: 60.0,
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 12.0, right: 12.0),

      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Image.network(model.user.avatar.url,
            fit: BoxFit.contain,
              width: 40.0,
              height: 40.0),

          new Expanded(

            child: new Container(
              padding: const EdgeInsets.only(left: 10.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(model.user.nick),
                  new Text(model.user.sign),
                ],
              ),
            ),


          ),
        ],
      ),

    );

    var contentSection = new Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: new Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new AspectRatio(
              aspectRatio: 2.0,
              child: new Image.network(model.cover.url,
                fit: BoxFit.fill,
              ),
          ),

          new Container(

            padding: const EdgeInsets.only(top: 15.0, bottom: 20.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                new Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: new Text(model.title,
                    style: new TextStyle(
                        fontSize: 17.0,
                        color: Colors.red
                    ),
                  ),

                ),

                new Text(model.subtitle,
                maxLines: 2,
                ),

              ],
            ),

          ),


          new Divider(height: 0.0),
        ],

      ),
    );

    var bottomSection = new Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
      child: new Row(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          new Text("栏目"),
          new Container(
            margin: const EdgeInsets.only(left: 5.0),
            child: new Text('栏目名'),
          ),

        ],
      ),
    );

    return new GestureDetector(

      onTap: _tapStrategy,
      child: new Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration:  new BoxDecoration(
          color: Colors.white,
        ),

        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            topSection,
            contentSection,
            bottomSection,

          ],
        ),
      ),
    );


  }
}