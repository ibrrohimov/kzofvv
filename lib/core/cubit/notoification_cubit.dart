import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationCubit extends Cubit<FlutterLocalNotificationsPlugin?> {
  NotificationCubit() : super(null);

  void setPlugin(FlutterLocalNotificationsPlugin e) {
    emit(e);
  }
}
