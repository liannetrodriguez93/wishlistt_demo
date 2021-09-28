part of 'wish_bloc.dart';

@immutable
class WishState {
  final List<WishModel> wishes;

  WishState({List<WishModel>? wishes, String? user}) : wishes = wishes ?? [];

  WishState copyWith({WishModel? wish, String? user}) => WishState(
        wishes: wish != null ? [...wishes, wish] : wishes,
      );

  WishState updateWish(WishModel wish) => WishState(
        wishes: [
          wish,
          ...wishes.where((element) => element.id != wish.id),
        ],
      );
}
