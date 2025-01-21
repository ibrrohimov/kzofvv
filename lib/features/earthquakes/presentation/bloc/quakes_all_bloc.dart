import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seysmoprognoz/features/earthquakes/data/models/quake_model.dart';
import 'package:seysmoprognoz/features/earthquakes/data/models/quake_params_model.dart';
import 'package:seysmoprognoz/features/earthquakes/domain/_index.dart';

part 'quakes_all_event.dart';
part 'quakes_all_state.dart';

class QuakesAllBloc extends Bloc<QuakesAllEvent, QuakesAllState> {
  QuakesAllBloc({
    required GetQuakesUsecase getQuakesUsecase,
  })  : getQuakes = getQuakesUsecase,
        super(QuakesAllInitial()) {
    on<GetQuakesAll>(_getQuakes);
  }

  final GetQuakesUsecase getQuakes;

  void _getQuakes(
    GetQuakesAll event,
    Emitter<QuakesAllState> emit,
  ) async {
    emit(GetQuakesAllLoading());

    final failureOrSuccess = await getQuakes(event.params);

    emit(
      failureOrSuccess.fold(
        (l) => GetQuakesAllError(message: l.message),
        (r) => GetQuakesAllSuccess(data: r),
      ),
    );
  }
}
