import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class WeatherEvent extends Equatable {
  WeatherEvent();
}


class FetchWeather extends WeatherEvent {
  final String city;

  FetchWeather({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}

class RefreshWeather extends WeatherEvent {
  final String city;

  RefreshWeather({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}
