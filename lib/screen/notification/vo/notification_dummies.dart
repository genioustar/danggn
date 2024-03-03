import 'package:fast_app_base/screen/notification/vo/notification_type.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';

final notification1 = DanggnNotification(
  type: NotificationType.official,
  title: '❤3월 가계부가 도착했어요!',
  description: '#당근 #단근가계부 #자원재순환 #따뜻한 거래',
  time: DateTime.now(),
);

final notification2 = DanggnNotification(
  type: NotificationType.official,
  title: '"당근"마켓 이용약관이 변경되었습니다.',
  description: '변경된 약관을 확인해주세요.',
  time: DateTime.now(),
);

get notification3 => DanggnNotification(
      type: NotificationType.local,
      title: '당근마켓에서 새로운 소식이 있어요!',
      description: '당근마켓에서 새로운 소식이 있어요!',
      time: DateTime.now(),
      isRead: true,
    );

final notification4 = DanggnNotification(
  type: NotificationType.legal,
  title: '가족집수리',
  description: '마음에 드셨다면 다른 이웃들을 위해 따뜻한 후기를 남겨주세요',
  time: DateTime.now(),
);

List<DanggnNotification> notificationList = [
  notification1,
  notification2,
  notification3,
  notification4
];
