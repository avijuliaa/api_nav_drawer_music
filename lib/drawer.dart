import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _drawerItem(
              icon: (Icons.image),
              text: 'My Artist',
              onTap: () {
                DefaultTabController.of(context)?.animateTo(0);
                Navigator.pop(context);
              }),
          _drawerItem(
              icon: (Icons.audiotrack),
              text: 'My Mood',
              onTap: () {
                DefaultTabController.of(context)?.animateTo(1);
                Navigator.pop(context);
              }),
          _drawerItem(
              icon: (Icons.access_time),
              text: 'Recently Play',
              onTap: () {
                DefaultTabController.of(context)?.animateTo(2);
                Navigator.pop(context);
              }),
          Divider(height: 20.0, thickness: 1),
          Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
              child: Text(
                "label",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              )),
          _drawerItem(icon: Icons.bookmark, text: "Saved", onTap: () => print("Tab to family Menu")),
        ],
      ),
    );
  }
}

class BelajarListView extends StatelessWidget {
  final List music = [
    "Melepas Lajang - Arvian Dwi",
    "Hujan - Jourdy Pranata",
    "Tutur Batinku - Yura Yunita",
    "Angel Baby - Troye Sivan",
    "Everything I Need - Skylar Grey",
    "Wes Tatas - Happy Asmara",
    "Aku Ikhlas - Woro Widowati",
    "Dalan Liyane - Denny Caknan",
    "Breaking Down - AILEE"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                title: Text(music[index], style: TextStyle(fontSize: 20)),
                subtitle: Text('album dari ' + music[index]),
                leading: CircleAvatar(
                  child: Text(music[index][0], // ambil karakter pertama text
                      style: TextStyle(fontSize: 20)),
                )),
          );
        },
        itemCount: music.length,
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

Widget _drawerHeader() {
  return UserAccountsDrawerHeader(
    currentAccountPicture: ClipOval(
      child: Image(image: AssetImage('assets/images/nunu.jpeg'), fit: BoxFit.cover),
    ),
    accountName: Text('Apiii Fav'),
    accountEmail: Text('apijuliaa@gmail.com'),
  );
}

Widget _drawerItem({required IconData icon, required String text, required GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
