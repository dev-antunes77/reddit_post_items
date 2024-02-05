import 'package:reddit_post_items/app/app.dart';
import 'package:reddit_post_items/data/hive_post_item_databae/hive_post_item_database.dart';
import 'package:reddit_post_items/data/hive_post_item_databae/hive_post_item_model.dart';
import 'package:reddit_post_items/data/post_item_database.dart';
import 'package:reddit_post_items/http_service/http_service.dart';
import 'package:reddit_post_items/repository/post_item_repository.dart';
import 'package:reddit_post_items/services/local_notitfication_service/local_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  late Locale initialLocale;
  Future<void> getSystemLocale() async {
    initialLocale = WidgetsBinding.instance.window.locale;
  }

  WidgetsFlutterBinding.ensureInitialized();
  final postItemDatabase = await _configPostItemDatabase();
  final notificationService = LocalNotificationService();
  final apiService = HttpConnection();
  final postRepository = PostItemRepository(apiService, postItemDatabase);
  getSystemLocale().then((_) => runApp(
        App(
          notificationService: notificationService,
          postItemRepository: postRepository,
          initialLocale: initialLocale,
        ),
      ));
}

Future<PostItemDatabase> _configPostItemDatabase() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PostItemHiveAdapter());
  return HivePostItemDatabase();
}
