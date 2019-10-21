import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'list/bloc_delegate.dart';
import 'timer/timer.dart';
import 'counter/counter.dart';
import 'list/list.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(ListApp());
}



