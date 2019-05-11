import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todoy_flutter/model/todo_model.dart';
import 'package:todoy_flutter/widgets/drawer.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      drawer: MyDrawer(),
      body: ScopedModelDescendant<TodoModel>(
        builder: (context, child, model) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: model.user != null
                        ? Image.network(model.user.photoUrl)
                        : Text("No Image"),
                    padding: EdgeInsets.all(30),
                  ),
                  Text(
                    model.user != null ? model.user.displayName : "",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text("sign out"),
                    onPressed: () {
                      model.logout(context);
                    },
                  )
                ],
              ),
            ),
      ),
    );
  }
}
