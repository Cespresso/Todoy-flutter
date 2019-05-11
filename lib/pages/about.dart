import 'package:flutter/material.dart';
import 'package:todoy_flutter/widgets/drawer.dart';

class About extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Text(
              "Todoy_Flutter",
              style:
              TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Image.asset("assets/logo.png"),
            Text(
              "version",
              style:
              TextStyle(fontSize: 24),
            ),
            Text(
              "0.0.1",
              style:
              TextStyle(fontSize: 12),
            ),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}