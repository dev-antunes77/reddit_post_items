import 'package:api_mock/app/app.dart';
import 'package:api_mock/data/hive_post_item_databae/hive_post_item_database.dart';
import 'package:api_mock/data/hive_post_item_databae/hive_post_item_model.dart';
import 'package:api_mock/data/post_item_database.dart';
import 'package:api_mock/http_service/http_service.dart';
import 'package:api_mock/repository/api_repository.dart';
import 'package:api_mock/services/local_notitfication_service/local_notification_service.dart';
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
  final postRepository = ApiRepository(apiService, postItemDatabase);
  getSystemLocale().then((_) => runApp(
        App(
          notificationService: notificationService,
          postRepository: postRepository,
          initialLocale: initialLocale,
        ),
      ));
}

Future<PostItemDatabase> _configPostItemDatabase() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PostItemHiveAdapter());
  return HivePostItemDatabase();
}
