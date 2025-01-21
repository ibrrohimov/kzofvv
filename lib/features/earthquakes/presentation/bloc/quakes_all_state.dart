part of 'quakes_all_bloc.dart';

abstract class QuakesAllState extends Equatable {
  const QuakesAllState();

  @override
  List<Object> get props => [];
}

class QuakesAllInitial extends QuakesAllState {}

class GetQuakesAllLoading extends QuakesAllState {}

class GetQuakesAllSuccess extends QuakesAllState {
  final List<QuakeModel> data;

  const GetQuakesAllSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class GetQuakesAllError extends QuakesAllState {
  final String message;

  const GetQuakesAllError({required this.message});

  @override
  List<Object> get props => [message];
}
