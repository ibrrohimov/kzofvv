import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seysmoprognoz/features/earthquakes/data/models/quake_model.dart';
import 'package:seysmoprognoz/features/earthquakes/data/models/quake_params_model.dart';
import 'package:seysmoprognoz/features/earthquakes/domain/_index.dart';

part 'quakes_event.dart';
part 'quakes_state.dart';

class QuakesBloc extends Bloc<HistoryEvent, QuakesState> {
  QuakesBloc({
    required GetQuakesUsecase getQuakesUsecase,
  })  : getQuakes = getQuakesUsecase,
        super(QuakesInitial()) {
    on<GetQuakes>(_getQuakes);
  }

  final GetQuakesUsecase getQuakes;

  void _getQuakes(
    GetQuakes event,
    Emitter<QuakesState> emit,
  ) async {
    emit(GetQuakesLoading());

    final failureOrSuccess = await getQuakes(event.params);

    emit(
      failureOrSuccess.fold(
        (l) => GetQuakesError(message: l.message),
        (r) => GetQuakesSuccess(data: r),
      ),
    );
  }
}
