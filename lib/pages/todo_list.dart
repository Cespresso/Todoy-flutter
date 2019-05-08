import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todoy_flutter/model/todo_model.dart';
import 'package:todoy_flutter/widgets/drawer.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todoy"),
      ),
      drawer: MyDrawer(), //
      body: Center(
        child: Column(
          children: <Widget>[
            ScopedModelDescendant<TodoModel>(
              builder: (context, child, model) => Text('${model.counter}'),
            ),
            ScopedModelDescendant<TodoModel>(
              builder: (context, child, model) => RaisedButton(
                    child: Text("ぼたん"),
                    onPressed: () {
                      model.increment();
                    },
                  ),
            )
          ],
        ),
      ),
    );
  }
}
