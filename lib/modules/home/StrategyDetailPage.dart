import 'package:flutter/material.dart';

class StrategyDetailPage extends StatelessWidget {

  StrategyDetailPage({this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("首页"),
      ),

      body: new Text("detail"),


    );
  }
}