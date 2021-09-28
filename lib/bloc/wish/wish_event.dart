part of 'wish_bloc.dart';

@immutable
abstract class WishEvent {}

class AddWish extends WishEvent {
  final WishModel wish;

  AddWish(this.wish);
}

class UpdateWishState extends WishEvent {
  final WishModel wish;

  UpdateWishState(this.wish);
}
