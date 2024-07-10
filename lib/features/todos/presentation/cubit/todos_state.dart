part of 'todos_cubit.dart';


abstract class TodosState extends Equatable {
  const TodosState();

  // Getter for Equatable
  @override
  List<Object> get props => [];
}

class TodosLoadingState extends TodosState {}

class TodosLoadedState extends TodosState {
  final List<TodoModel> todos;

  const TodosLoadedState({required this.todos});

  @override
  List<Object> get props => [todos];
}

class TodosErrorState extends TodosState {
  final String message;

  const TodosErrorState({required this.message});

  @override
  List<Object> get props => [message];
}