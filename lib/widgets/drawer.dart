import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text("Todoy"),
          ),
          ListTile(
            title: Text("Home"),
          ),
          ListTile(
            title: Text("Profile"),
          ),
          Divider(),
          ListTile(
            title: Text("About"),
          ),

        ],
      ),
    );
  }
}
