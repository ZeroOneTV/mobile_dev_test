import 'package:flutter/material.dart';
import '../Strings.dart';

class HomeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(Strings.titleApp),
            centerTitle: true,
            backgroundColor: Colors.amber,
          ),
      )
    );
  }
}