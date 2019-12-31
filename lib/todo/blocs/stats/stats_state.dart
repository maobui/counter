import 'package:equatable/equatable.dart';

abstract class StatsState extends Equatable {
  StatsState();

  @override
  List<Object> get props => [];
}

class StatsLoading extends StatsState {}

class StatsLoaded extends StatsState {
  final int numActive;
  final int numCompleted;

  StatsLoaded(this.numActive, this.numCompleted);

  @override
  List<Object> get props => [numActive, numCompleted];

  @override
  String toString() {
    return 'StatsLoaded { numActive: $numActive, numCompleted: $numCompleted }';
  }
}
