import 'package:flutter_bloc/flutter_bloc.dart';

class QuakeParamsCubit extends Cubit<Map<String, dynamic>> {
  QuakeParamsCubit() : super({});

  void setParams(Map<String, dynamic> e) {
    emit(e);
  }
}
