import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todoy_flutter/model/entity/todo.dart';
import 'package:todoy_flutter/model/todo_model.dart';
import 'package:todoy_flutter/widgets/drawer.dart';

class TodoList extends StatelessWidget {
  _getTodosIfNull(BuildContext context) {
    List<Todo> todos =
        ScopedModel.of<TodoModel>(context, rebuildOnChange: true).todos;
    if (todos == null) {
      ScopedModel.of<TodoModel>(context, rebuildOnChange: true).getTodos();
    }
  }

  Widget _buildContent(BuildContext context) {
    List<Todo> todos =
        ScopedModel.of<TodoModel>(context, rebuildOnChange: true).todos;
    if (todos == null) {
      _getTodosIfNull(context);
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (todos.length == 0) {
      Center(
        child: Text("No Todos"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(todos[index].title ?? ""),
            subtitle: Text(todos[index].body ?? ""),
            leading: todos[index].completed
                ? Icon(Icons.check_box)
                : Icon(Icons.check_box_outline_blank),
          );
        },
        itemCount: todos.length,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Todoy"),
        ),
        drawer: MyDrawer(), //
        body: _buildContent(context));
  }
}
