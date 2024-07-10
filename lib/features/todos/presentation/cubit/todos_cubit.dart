import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/datasources/todo_api.dart';
import '../../data/models/todo_model.dart';
part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  final TodosApi todosApi;
  TodosCubit({required this.todosApi}) : super(TodosLoadingState());


  void getAllTodos () async {
    emit(TodosLoadingState());
    try {
      final todos = await todosApi.getAllTodoModels();
      emit(TodosLoadedState(todos: todos));
    } catch (e) {
      const message = "Error while loading todos: ";
      emit(const TodosErrorState(message: message));
    }
  }

}
