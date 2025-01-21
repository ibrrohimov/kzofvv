part of 'quakes_all_bloc.dart';

abstract class QuakesAllEvent extends Equatable {
  const QuakesAllEvent();

  @override
  List<Object> get props => [];
}

class GetQuakesAll extends QuakesAllEvent {
  final QuakeParamsModel params;

  const GetQuakesAll(this.params);
}
