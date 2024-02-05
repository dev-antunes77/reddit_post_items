// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:reddit_post_items/app/app_cubit.dart';
import 'package:reddit_post_items/app/app_skeleton.dart';
import 'package:reddit_post_items/core/l10n/generated/l10n.dart';
import 'package:reddit_post_items/features/creating_page/cubit/creating_cubit.dart';
import 'package:reddit_post_items/features/home_page/cubit/home_cubit.dart';
import 'package:reddit_post_items/features/settings_page/cubit/settings_cubit.dart';
import 'package:reddit_post_items/repository/post_item_repository.dart';
import 'package:reddit_post_items/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.notificationService,
    required this.postItemRepository,
    required this.initialLocale,
  }) : super(key: key);

  final NotificationService notificationService;
  final PostItemRepository postItemRepository;
  final Locale initialLocale;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (_) => AppCubit()),
        BlocProvider<HomeCubit>(
            create: (_) => HomeCubit(
                  postItemRepository,
                )),
        BlocProvider<CreatingCubit>(
            create: (_) => CreatingCubit(postItemRepository)),
        BlocProvider<SettingsCubit>(
            create: (_) => SettingsCubit(initialLocale)),
      ],
      child: MaterialApp(
        title: 'Reddit api',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.delegate.supportedLocales,
        locale: initialLocale,
        home: AppSkeleton(notificationService),
      ),
    );
  }
}
