import 'package:equatable/equatable.dart';
import '../../models/models.dart';

abstract class TabEvent extends Equatable {
  TabEvent();
}

class UpdateTab extends TabEvent {
  final AppTab tab;

  UpdateTab(this.tab);

  @override
  List<Object> get props => [tab];

  @override
  String toString() => 'UpdateTab { tab: $tab }';
}
