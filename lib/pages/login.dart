import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todoy_flutter/model/firebase_model.dart';

class Login extends StatelessWidget {
  DecorationImage _buildBackGroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      image: AssetImage("assets/background.jpg"),
    );
  }

  /*
  *
  *
  *
  * */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<FirebaseModel>(
        builder: (context, child, model) => Container(
              decoration: BoxDecoration(
                image: _buildBackGroundImage(),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Todoy",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    Image.asset("assets/logo.png"),
                    SizedBox(
                      height: 150,
                    ),
                    RaisedButton(
                      child: Text("Sign By Google"),
                      onPressed: () {
                        model.login();
                      },
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
