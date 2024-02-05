import 'package:reddit_post_items/core/models/notification.dart';

abstract interface class NotificationService {
  void initializeNitification({Function? onCallback});
  void showNotification(TimeoutNotification notification);
}
