import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list/bloc_delegate.dart';
import 'login/authentication_bloc.dart';
import 'login/authentication_event.dart';
import 'login/login.dart';
import 'login/user_repository.dart';
import 'timer/timer.dart';
import 'counter/counter.dart';
import 'list/list.dart';

void main() {
//  BlocSupervisor.delegate = SimpleBlocDelegate();
//  runApp(ListApp());

  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      builder: (context) {
        return AuthenticationBloc(userRepository: userRepository)..add(AppStarted());
      },
      child: LoginApp(userRepository: userRepository),
    ),
  );
}



