import 'package:flutter/material.dart';
import '../../data/models/todo_model.dart';

class TodosWidget extends StatelessWidget {
  final List<TodoModel> todos;
  const TodosWidget({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(todos[index].id.toString()),
            ),
            title: Text(todos[index].title),
            trailing: todos[index].completed
                ? const Icon(Icons.done, color: Colors.green)
                : null,
          ),
        );
      },
    );
  }
}