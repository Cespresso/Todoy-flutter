import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todoy_flutter/model/todo_model.dart';
import 'package:todoy_flutter/widgets/drawer.dart';

class Profile extends StatelessWidget {
  _checkUser(BuildContext context) {
    FirebaseUser _user =
        ScopedModel.of<TodoModel>(context, rebuildOnChange: true).user;
    if (_user == null) {
      Navigator.pushReplacementNamed(context, "/");
    }
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 100)).then((_) {
      _checkUser(context);
    });
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
                    child: Image.network(model.user.photoUrl ?? ""),
                    padding: EdgeInsets.all(30),
                  ),
                  Text(
                    model.user.displayName,
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20,),
                  RaisedButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text("sign out"),
                    onPressed: () {
                      model.logout();
                    },
                  )
                ],
              ),
            ),
      ),
    );
  }
}