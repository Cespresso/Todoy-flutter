import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todoy_flutter/model/todo_model.dart';
import 'package:todoy_flutter/pages/about.dart';
import 'package:todoy_flutter/pages/login.dart';
import 'package:todoy_flutter/pages/profile.dart';
import 'package:todoy_flutter/pages/todo_detail.dart';
import 'package:todoy_flutter/pages/todo_list.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final TodoModel todoModel = TodoModel();

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: ScopedModel<FirebaseModel>(
//        model: FirebaseModel(),
//        child: Login(),
//      ),
      routes: {
        "/": (BuildContext context) => ScopedModel<TodoModel>(
              model: widget.todoModel,
              child: Login(),
            ),
        "/todos": (BuildContext context) => ScopedModel<TodoModel>(
              model: widget.todoModel,
              child: TodoList(),
            ),
        "/profile": (BuildContext context) => ScopedModel<TodoModel>(
          model: widget.todoModel,
          child: Profile(),
        ),
        "/about": (BuildContext context) => ScopedModel<TodoModel>(
          model: widget.todoModel,
          child: About(),
        ),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split("/");
        if (pathElements[0] != "") {
          return null;
        }
        if (pathElements[1] == "todo") {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ScopedModel<TodoModel>(
              model: widget.todoModel,
              child: TodoDetail(index),
            ),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => ScopedModel<TodoModel>(
                model: widget.todoModel,
                child: Login(),
              ),
        );
      },
    );
  }
}
