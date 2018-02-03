import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:demo02/modules/home/StrategyDetailPage.dart';


var strategyDetailHandler = new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return new StrategyDetailPage(id: params["id"]);
});

class ABRouter {

  static Router router;

  static void defineRoutes(Router router) {
    router.define("/strategy/:id", handler: strategyDetailHandler);
  }
}