import 'package:flutter/material.dart';
import 'package:mobile_dev_test/component/RequestsHTTP.dart';
import 'activitys/HomePage.dart';
import 'activitys/DescribeGame.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: HomePage.route,
      routes: <String, WidgetBuilder>{
        HomePage.route: (context) => HomePage(),
        DescribeGame.route: (context) => DescribeGame(),
      }),
  );
}
