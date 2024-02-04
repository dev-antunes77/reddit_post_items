import 'package:api_mock/app/app_cubit.dart';
import 'package:api_mock/core/l10n/generated/l10n.dart';
import 'package:api_mock/core/models/post_item.dart';
import 'package:api_mock/core/theme/text_styles_data.dart';
import 'package:api_mock/features/creating_page/cubit/creating_cubit.dart';
import 'package:api_mock/features/creating_page/parts/creating_content.dart';
import 'package:api_mock/utils/call_simple_dialog.dart';
import 'package:api_mock/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatingPage extends StatelessWidget {
  const CreatingPage(this.postItem, {super.key});
  final PostItem? postItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<CreatingCubit, CreatingState>(
          listenWhen: (previous, current) => previous != current,
          listener: (context, state) {
            if (state is CreatingSuccessState) {
              context.read<AppCubit>().navigatePage(0, realodHome: true);
            } else if (state is CreatingErrorState) {
              _callEditiOrDeleteDialog(context, postItem);
            }
          },
          child: BlocBuilder<CreatingCubit, CreatingState>(
            builder: (context, state) {
              if (state is CreatingLoadingState) {
                return const CustomLoadingSpinner();
              }
              return CreatingContent(postItem);
            },
          ),
        ),
      ),
    );
  }
}

Future<dynamic> _callEditiOrDeleteDialog(
        BuildContext context, PostItem? item) =>
    callSimpleDisplayDialog(
      context,
      content: Text(
        AppLocalizations.current.errorOnItemHandling,
        style: TextStyleData.languageTitle,
      ),
      actions: [
        TextButton(
          onPressed: () => _onItemHandlingTryAgain(context, item),
          child: Text(AppLocalizations.current.tryAgain),
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<AppCubit>().navigatePage(0);
            },
            child: Text(AppLocalizations.current.backToHome)),
      ],
    );

void _onItemHandlingTryAgain(BuildContext context, PostItem? item) {
  if (item != null) {
    context.read<CreatingCubit>().updatePostItem();
  } else {
    context.read<CreatingCubit>().createPostItem();
  }
  Navigator.pop(context);
}
