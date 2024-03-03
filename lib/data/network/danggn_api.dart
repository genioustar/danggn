import 'package:fast_app_base/data/network/result/api_error.dart';
import 'package:fast_app_base/data/simple_result.dart';
import 'package:fast_app_base/screen/notification/vo/notification_dummies.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';

class DanggnAPI {
  static Future<SimpleResult<List<DanggnNotification>, ApiError>>
      getNotificationList() async {
    await Future.delayed(const Duration(seconds: 1));
    return SimpleResult.success(notificationList);
  }
}
