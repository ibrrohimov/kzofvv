import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<String> {
  LanguageCubit() : super('uz');

  void setLanguage(String e) {
    emit(e);
  }
}
