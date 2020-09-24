import 'package:flutter/material.dart';
import 'package:mobile_dev_test/component/RequestsHTTP.dart';
import 'package:mobile_dev_test/models/GameCover.dart';

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
  Future<List<GameCover>> futureGameList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.titleApp),
        centerTitle: true,
      ),
      body: Center(
          child: FutureBuilder<List<GameCover>>(
            future: futureGameList,
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                print("nope");
                return Center(child: CircularProgressIndicator());
              } else {
                print(snapshot.data);
                return Container(child: gameGridView(snapshot.data));
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
    }
  }

  GridView gameGridView(List<GameCover> data) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemCount: data.length,
      padding: EdgeInsets.all(2.0),
      itemBuilder: (BuildContext context, int index) {
        return _tile(
            data[index].id.toString(), data[index].name, data[index].url);
      },
    );
  }

  GridTile _tile(String id, String title, String coverUrl) =>
      GridTile(
          child: InkWell(
              onTap: () => print("click"),
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
                              child: Image.network(
                                  coverUrl, fit: BoxFit.contain),
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

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//       appBar: AppBar(
//         title: Text(Strings.titleApp),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: GridView.count(
//           primary: false,
//           padding: const EdgeInsets.all(20),
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//           crossAxisCount: 2,
//           children: <Widget>[
//             Container(
//               padding: const EdgeInsets.all(8),
//               child: const Text('Revolution, they...'),
//               color: Colors.teal[700],
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: ()  {
//           RequestsHTTP request = new RequestsHTTP();
//           //request.getGames();
//         },
//         child: Icon(Icons.navigation),
//         backgroundColor: Colors.green,
//       ));