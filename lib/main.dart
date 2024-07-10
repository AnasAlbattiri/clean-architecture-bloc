import 'package:clean_architecture/features/internet/presentation/cubit/internet_cubit.dart';
import 'package:clean_architecture/features/todos/data/datasources/todo_api.dart';
import 'package:clean_architecture/features/todos/presentation/bloc/todos_bloc.dart';
import 'package:clean_architecture/features/todos/presentation/cubit/todos_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/todos/presentation/pages/todos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosCubit(todosApi: TodosApi())..getAllTodos(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clean Demo',
        theme: ThemeData(
          useMaterial3: false,
        ),
        home: const TodosPage(),
      ),
    );
  }
}

