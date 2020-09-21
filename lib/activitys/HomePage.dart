import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobile_dev_test/component/RequestsHTTP.dart';
import '../Strings.dart';

class HomePage extends StatelessWidget {
  static final String route = "HomePage";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'Homepage',
          home: HomePageState(),
    );
  }
}
class HomePageState extends StatefulWidget{
    HomePageState({Key key}) : super(key: key);

    @override
    _HomeAppState createState() => _HomeAppState();
}
class _HomeAppState extends State<HomePageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.titleApp),
        centerTitle: true,
      ),
      body: Center(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Revolution, they...'),
                color: Colors.teal[700],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: ()  {
                RequestsHTTP request = new RequestsHTTP();
                //request.getGames();
            },
            child: Icon(Icons.navigation),
            backgroundColor: Colors.green,
        ));
  }
}