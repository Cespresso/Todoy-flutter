import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'package:todoy_flutter/model/entity/todo.dart';

class TodoModel extends Model {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser user;
  List<Todo> todos;

  login() async {
    user = await _handleSignIn();
    notifyListeners();
  }
  logout(BuildContext context) async{
    await _auth.signOut();
    user = null;
    await Navigator.pushReplacementNamed(context, "/");
    notifyListeners();
  }

  checkAuth(BuildContext context) async{
    user = await _auth.currentUser();
    if(user!=null){
      await Navigator.pushReplacementNamed(context, "/todos");
    }
    notifyListeners();
  }

  getTodos() async {
    if (user == null) return;
    String token = await user.getIdToken();
    var response = await http.get(
      "https://espresso-dev-api.site/todo",
      headers: {"authorization": "Bearer "+token},
    );
    print(response.body);
    if(response.statusCode == 200){
      List todoList = jsonDecode(response.body);
      todos = todoList.map((dynamic t)=>Todo.fromJson(t)).toList();
      print(todos);
    }else{
      todos = [];
    }
    notifyListeners();
  }

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount deleteUserResult =
        await _googleSignIn.disconnect().catchError((err) {});
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);
    print("signed in " + user.displayName);
    return user;
  }
}
