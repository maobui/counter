import 'package:equatable/equatable.dart';
import '../../models/models.dart';

abstract class StatsEvent extends Equatable {
  StatsEvent();
}

class UpdateStats extends StatsEvent {
  final List<Todo> todos;

  UpdateStats(this.todos);

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'UpdateStats { todos: $todos }';
}
