// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:reddit_post_items/core/l10n/generated/l10n.dart';
import 'package:reddit_post_items/core/theme/text_styles_data.dart';
import 'package:reddit_post_items/features/home_page/cubit/home_cubit.dart';
import 'package:reddit_post_items/features/home_page/parts/home_page_content.dart';
import 'package:reddit_post_items/core/utils/call_simple_dialog.dart';
import 'package:reddit_post_items/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage(
    this.reloadHome, {
    Key? key,
  }) : super(key: key);

  final bool reloadHome;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final cubit = context.read<HomeCubit>();
    cubit.onInit(widget.reloadHome);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is HomeErrorState) {
          _callEditiOrDeleteDialog(context);
        }
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const CustomLoadingSpinner();
          }

          return HomePageContent(state);
        },
      ),
    );
  }
}

Future<dynamic> _callEditiOrDeleteDialog(BuildContext context) =>
    callSimpleDisplayDialog(
      context,
      content: Text(
        AppLocalizations.current.errorBringPostItems,
        style: TextStyleData.languageTitle,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<HomeCubit>().onInit(true);
          },
          child: Text(AppLocalizations.current.tryAgain),
        ),
        TextButton(
            onPressed: () => _exitApp(context),
            child: Text(AppLocalizations.current.closeApp)),
      ],
    );

void _exitApp(BuildContext context) {
  if (Platform.isAndroid || Platform.isIOS) {
    exit(0);
  }
}
