import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todoy_flutter/model/entity/todo.dart';
import 'package:todoy_flutter/model/todo_model.dart';

class TodoDetail extends StatelessWidget {
  final int index;

  TodoDetail(this.index);

  @override
  Widget build(BuildContext context) {
    Todo todo =
        ScopedModel.of<TodoModel>(context, rebuildOnChange: true).todos[index];
    return Scaffold(
      appBar: AppBar(
        title: Text("Todoy"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              todo.title ?? "",
              style: TextStyle(fontSize: 24),
            ),
            Text(todo.body ?? "")
          ],
        ),
      ),
    );
  }
}
