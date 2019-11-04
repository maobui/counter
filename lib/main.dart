import 'package:counter/weather/weather_app.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'list/bloc_delegate.dart';
import 'login/authentication_bloc.dart';
import 'login/authentication_event.dart';
import 'login/login.dart';
import 'login/user_repository.dart';
import 'timer/timer.dart';
import 'counter/counter.dart';
import 'list/list.dart';
import 'weather/setting.dart';
import 'weather/theme.dart';
import 'weather/weather_api_client.dart';
import 'weather/weather_repostitory.dart';

void main() {
//  BlocSupervisor.delegate = SimpleBlocDelegate();
//  runApp(ListApp());

  /*BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      builder: (context) {
        return AuthenticationBloc(userRepository: userRepository)..add(AppStarted());
      },
      child: LoginApp(userRepository: userRepository),
    ),
  );*/

  BlocSupervisor.delegate = SimpleBlocDelegate();
  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          builder: (context) => ThemeBloc(),
        ),
        BlocProvider<SettingsBloc>(
          builder: (context) => SettingsBloc(),
        ),
      ],
      child: WeatherApp(weatherRepository: weatherRepository),
    ),
  );
}



