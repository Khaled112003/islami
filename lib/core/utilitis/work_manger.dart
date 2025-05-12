import 'package:islami/core/utilitis/local_notification.dart';
import 'package:workmanager/workmanager.dart';

class WorkManagerService {
  void registerMyTask() async {
    await Workmanager().registerPeriodicTask(
      'id1',
      'daily_adhkar_reminder',
      frequency: const Duration(hours: 24),
    );
  }

  Future<void> init() async {
    await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
    registerMyTask();
  }

  void cancelTask(String id) {
    Workmanager().cancelAll();
  }
}

@pragma('vm-entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    await LocalNotificationService.scheduleDailyReminderAt11_55PM();
    return Future.value(true);
  });
}
