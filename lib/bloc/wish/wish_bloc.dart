import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wishlist_demo/models/wish_model.dart';

part 'wish_event.dart';
part 'wish_state.dart';

class WishBloc extends Bloc<WishEvent, WishState> {
  WishBloc() : super(WishState());

  @override
  Stream<WishState> mapEventToState(WishEvent event) async* {
    if (event is AddWish) {
      yield state.copyWith(wish: event.wish);
    } else if (event is UpdateWishState) {
      yield state.updateWish(event.wish);
    }
  }
}
