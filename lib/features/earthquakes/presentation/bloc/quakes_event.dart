part of 'quakes_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class GetQuakes extends HistoryEvent {
  final QuakeParamsModel params;

  const GetQuakes(this.params);
}
