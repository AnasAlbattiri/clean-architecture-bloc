import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/todos/data/models/todo_model.dart';
import 'package:equatable/equatable.dart';

import '../../data/datasources/todo_api.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodosApi todosApi;
  TodosBloc({required this.todosApi}) : super(TodosLoadingState()) {
    on<TodosEvent>((event, emit) async {
      if(event is GetAllTodosEvent){
        emit(TodosLoadingState());
        try {
          final todos = await todosApi.getAllTodoModels();
          emit(TodosLoadedState(todos: todos));
        } catch (e) {
          const message = "Error while loading todos: ";
          emit(const TodosErrorState(message: message));
        }
      }
    });
  }
}
