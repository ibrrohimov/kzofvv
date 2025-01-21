import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(true);

  void setTheme(bool e) {
    () async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setInt('theme', e ? 1 : 0);
    }();

    emit(e);
  }

  void setSavedTheme() {
    late bool value;
    () async {
      final prefs = await SharedPreferences.getInstance();
      final theme = prefs.getInt('theme');
      print(theme);
      value = (theme ?? 1) == 1;
      emit(value);
    }();
  }
}
