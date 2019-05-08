import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text("Home"),
          ),
          ListTile(
            title: Text("Profile"),
          ),
          ListTile(
            title: Text("Settings"),
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
