import 'package:equatable/equatable.dart';
import '../../models/models.dart';

abstract class FilteredTodosEvent extends Equatable {
  FilteredTodosEvent();
}

class UpdateFilter extends FilteredTodosEvent {
  final VisibilityFilter filter;

  UpdateFilter(this.filter);

  @override
  List<Object> get props => [filter];

  @override
  String toString() => 'UpdateFilter { filter: $filter }';
}

class UpdateTodos extends FilteredTodosEvent {
  final List<Todo> todos;

  UpdateTodos(this.todos);

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'UpdateTodos { todos: $todos }';
}
