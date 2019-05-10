import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todoy_flutter/model/todo_model.dart';

class Login extends StatelessWidget {
  DecorationImage _buildBackGroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      image: AssetImage("assets/background.jpg"),
    );
  }

  _checkUser(BuildContext context) {
    FirebaseUser _user =
        ScopedModel.of<TodoModel>(context, rebuildOnChange: true).user;
    if (_user != null) {
      Navigator.pushReplacementNamed(context, "/todos");
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 100)).then((_) {
      _checkUser(context);
    });
    return Scaffold(
      body: ScopedModelDescendant<TodoModel>(
        builder: (context, child, model) => Container(
              decoration: BoxDecoration(
                image: _buildBackGroundImage(),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      "Todoy",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Image.asset("assets/logo.png"),
                    RaisedButton(
                      child: Text("SignIn By Google"),
                      onPressed: () {
                        model.login();
                      },
                    ),
                    SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
