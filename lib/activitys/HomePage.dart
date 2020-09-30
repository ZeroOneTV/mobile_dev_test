import 'package:flutter/material.dart';
import 'package:mobile_dev_test/activitys/DescribeGame.dart';
import 'package:mobile_dev_test/component/RequestsHTTP.dart';
import 'package:mobile_dev_test/models/GameCover.dart';
import 'package:mobile_dev_test/models/Platform.dart';

import '../Strings.dart';


class HomePage extends StatelessWidget {
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
  Future<List<GameCover>> futureGameList;
  Future<List<Platform>> futurePlatform;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: FutureBuilder(
          future: futurePlatform,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return _platformListView(snapshot.data);
            }
          }),
      ),
      appBar: AppBar(
        title: Text(Strings.titleApp),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
          child: FutureBuilder<List<GameCover>>(
            future: futureGameList,
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Container(child: _gameGridView(snapshot.data));
              }
            },
          )
      ),

    );
  }

  @override
  void initState() {
    super.initState();
    futureGameList = RequestsHTTP.getGameWithCovers();
    futurePlatform = RequestsHTTP.getPlatform();
    }

  @override
  void dispose() {
    super.dispose();
  }

}

  ListView _platformListView(List<Platform> data){
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(data[i].name),
            onTap: (){
              Navigator.pop(context);
            },
          );
        },
    );
  }

  GridView _gameGridView(List<GameCover> data) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemCount: data.length,
      padding: EdgeInsets.all(2.0),
      itemBuilder: (BuildContext context, int i) {
        return tile(context,data[i].id.toString(), data[i].name, data[i].url,data[i].summary);
      },
    );
  }

  GridTile tile(BuildContext context,String id, String title, String coverUrl,String summary) =>
      GridTile(
          child: InkWell(
              onTap: () =>  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DescribeGameState(id: id,title: title,coverUrl: coverUrl,summary: summary))),
              child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ], borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Image.network(coverUrl, fit: BoxFit.fill),
                            ),
                            Container(
                              child: Text(title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                  )),
                            ),
                          ])))));