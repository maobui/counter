import 'package:bloc/bloc.dart';
import 'package:counter/login/authentication_event.dart';
import 'package:counter/login/authentication_state.dart';
import 'package:counter/login/user_repository.dart';
import 'package:flutter/material.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  @override
  // TODO: implement initialState
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async*{
    // TODO: implement mapEventToState
    if(event is AppStarted) {
      final hasToken = await userRepository.hasToken();
      if(hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}