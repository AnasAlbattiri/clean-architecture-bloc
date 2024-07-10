import 'package:flutter/material.dart';

class TodoModel {
  int id;
  String title;
  bool completed;

  TodoModel({required this.id, required this.title, required this.completed});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }
}