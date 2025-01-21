part of 'quakes_bloc.dart';

abstract class QuakesState extends Equatable {
  const QuakesState();

  @override
  List<Object> get props => [];
}

class QuakesInitial extends QuakesState {}

class GetQuakesLoading extends QuakesState {}

class GetQuakesSuccess extends QuakesState {
  final List<QuakeModel> data;

  const GetQuakesSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class GetQuakesError extends QuakesState {
  final String message;

  const GetQuakesError({required this.message});

  @override
  List<Object> get props => [message];
}
