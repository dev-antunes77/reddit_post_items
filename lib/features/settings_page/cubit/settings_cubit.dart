import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this.initialLocale) : super(const SettingsState());

  final Locale initialLocale;

  void onTakingPicture(XFile file) =>
      emit(SettingsState(file: File(file.path)));

  void onSwitchLanguage() => emit(const SettingsUpdatedState());
}
