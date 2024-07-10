import 'package:clean_architecture/features/todos/presentation/widgets/loading_widget.dart';
import 'package:clean_architecture/features/todos/presentation/widgets/todos_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/todos_cubit.dart';
import '../widgets/error_widget.dart';


class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Todos'),
        ),
        body: BlocBuilder<TodosCubit, TodosState>(
          builder: (context, state) {
            if(state is TodosLoadedState){
              return TodosWidget(todos: state.todos);
            } else if (state is TodosErrorState){
              return MyErrorWidget(message: state.message,);
            } else {
              return const LoadingWidget();
            }
          },
        )
    );
  }
}
