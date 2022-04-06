import 'package:flutter/material.dart';
import 'drawer.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.blue),
    title: "Spotifoy",
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              title: Text("My Playlist"),
              bottom: TabBar(
                tabs: [
                  new Tab(icon: new Icon(Icons.group), text: "artist"),
                  new Tab(icon: new Icon(Icons.audiotrack), text: "music"),
                  new Tab(icon: new Icon(Icons.access_time), text: "recent"),
                ],
              )),
          drawer: DrawerWidget(),
          body: TabBarView(children: <Widget>[
            BelajarListView(),
            BelajarListView(),
            BelajarListView(),
          ]),
        ),
      );
}
