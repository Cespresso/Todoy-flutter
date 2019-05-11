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
            onTap: ()=>Navigator.pushReplacementNamed(context, "/todos"),
          ),
          ListTile(
            title: Text("Profile"),
            onTap: ()=>Navigator.pushReplacementNamed(context, "/profile"),
          ),
          Divider(),
          ListTile(
            title: Text("About"),
            onTap: ()=>Navigator.pushReplacementNamed(context, "/about"),
          ),

        ],
      ),
    );
  }
}
