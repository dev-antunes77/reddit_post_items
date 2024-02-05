// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:reddit_post_items/repository/post_item_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:reddit_post_items/core/models/post_item.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._postItemRepository,
  ) : super(HomeLoadingState());
  final PostItemRepository _postItemRepository;

  Future<void> onInit(bool realodHome) async {
    if (!realodHome) return;
    try {
      emit(HomeLoadingState());
      final result = await _getItems();
      emit(HomeSuccessState(posts: result));
    } catch (exception) {
      emit(HomeErrorState(error: exception.toString()));
    }
  }

  Future<List<PostItem>> _getItems() async => _postItemRepository.getAllPosts();

  Future<void> delete(int hiveIndex) async {
    try {
      emit(HomeLoadingState());
      await _postItemRepository.delete(hiveIndex);
      final result = await _getItems();
      emit(HomeSuccessState(posts: result));
    } catch (exception) {
      emit(HomeErrorState(posts: state.posts, error: exception.toString()));
    }
  }
}
