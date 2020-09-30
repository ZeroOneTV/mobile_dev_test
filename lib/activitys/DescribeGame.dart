import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescribeGameState extends StatefulWidget{
  String id,title,coverUrl,summary;

  DescribeGameState({Key key, @required this.id,this.title,this.coverUrl,this.summary}) : super(key : key);

  @override
  _DescribeGameState createState() => _DescribeGameState(id,title,coverUrl,summary);
}

class _DescribeGameState extends State<DescribeGameState>{

  String id,title,coverUrl,summary;
  _DescribeGameState(this.id,this.title,this.coverUrl,this.summary);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.amber,
        ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
            child: Image.network(
              coverUrl,
              alignment: Alignment.center,
            ),
          ),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            // Text(),
            // Text(),

            Divider(height: 60.0),
            Text(summary,style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}