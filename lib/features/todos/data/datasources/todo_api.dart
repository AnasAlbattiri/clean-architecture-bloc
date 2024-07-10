import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/todo_model.dart';

class TodosApi {
  Future<List<TodoModel>> getAllTodoModels() async {
    try {
      const String url = "https://jsonplaceholder.typicode.com/todos";

      var response = await http.get(Uri.parse(url));

      List<TodoModel> todoModels = (json.decode(response.body))
          .map<TodoModel>((jsonTodoModel) => TodoModel.fromJson(jsonTodoModel))
          .toList();

      return todoModels;
    } catch (e) {
      rethrow;
    }
  }
}