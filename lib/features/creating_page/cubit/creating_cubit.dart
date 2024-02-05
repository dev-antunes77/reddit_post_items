import 'package:api_mock/core/l10n/generated/l10n.dart';
import 'package:api_mock/core/models/post_item.dart';
import 'package:api_mock/repository/post_item_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'creating_state.dart';

class CreatingCubit extends Cubit<CreatingState> {
  CreatingCubit(this._postItemRepository) : super(CreatingInitialState());

  final PostItemRepository _postItemRepository;

  Future<void> createPostItem() async {
    try {
      emit(CreatingLoadingState(item: state.item));
      await _postItemRepository.create(state.item);
      emit(CreatingSuccessState());
    } catch (exception) {
      emit(CreatingErrorState(
        item: state.item,
        error: AppLocalizations.current.handlePostError(exception.toString()),
      ));
    }
  }

  Future<void> updatePostItem() async {
    try {
      emit(CreatingLoadingState(item: state.item));
      await _postItemRepository.update(state.item);
      emit(CreatingSuccessState());
    } catch (exception) {
      emit(CreatingErrorState(
        item: state.item,
        error: AppLocalizations.current.handlePostError(exception.toString()),
      ));
    }
  }

  bool get validToProceed =>
      state.item.author.isNotEmpty && state.item.title.isNotEmpty;

  void onEditionInitiation(PostItem? item) =>
      emit(CreatingInitialState(item: item));

  void onChangeItemAuthor(String author) =>
      emit(CreatingInitialState(item: state.item.copyWith(author: author)));

  void onChangeItemTitle(String title) =>
      emit(CreatingInitialState(item: state.item.copyWith(title: title)));

  void onChangeItemUpNumber(String ups) => emit(
      CreatingInitialState(item: state.item.copyWith(ups: int.tryParse(ups))));

  void onChangeItemCommentNumber(String commentNum) =>
      emit(CreatingInitialState(
          item:
              state.item.copyWith(numberOfComments: int.tryParse(commentNum))));
}
