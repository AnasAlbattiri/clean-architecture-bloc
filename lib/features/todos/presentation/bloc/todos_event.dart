part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  // Getter for Equatable
  @override
  List<Object> get props => [];
}


class GetAllTodosEvent extends TodosEvent {

}