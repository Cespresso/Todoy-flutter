class Todo {
  final int id;
  final String title;
  final String body;
  final bool completed;

  Todo(this.id, this.title, this.body, this.completed);

  Todo.fromJson(Map<String, dynamic> json)
      :id = json["id"],
        title = json["title"],
        body = json["body"],
        completed = json["completed"];
}