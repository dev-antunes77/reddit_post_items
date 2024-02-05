import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:reddit_post_items/app/app_state.dart';
import 'package:reddit_post_items/core/enums.dart';
import 'package:reddit_post_items/core/l10n/generated/l10n.dart';
import 'package:reddit_post_items/core/models/post_item.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(
          const AppState(
              0, reloadHome: true, Locale.fromSubtags(languageCode: 'en')),
        );

  void navigatePage(int newPage,
          {PostItem? postItem, bool realodHome = false}) =>
      emit(AppState(newPage, state.locale,
          postItem: postItem, reloadHome: realodHome));

  Future<void> onSwitchLanguage(Language language) async {
    final Locale locale;
    switch (language) {
      case Language.en:
        locale = const Locale.fromSubtags(languageCode: 'en');
        break;
      case Language.pt:
        locale = const Locale.fromSubtags(languageCode: 'pt');
        break;
    }
    AppLocalizations.delegate.load(locale);
    emit(AppState(state.index, locale));
  }
}
