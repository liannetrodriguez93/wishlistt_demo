import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState());

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Login) {
      add(LoginLoading());
    } else if (event is LoginLoading) {
      yield state.copyWith(isLoading: true);
    } else if (event is Logged) {
      yield state.copyWith(isLoading: false, isLogged: true, user: event.user, userRole: event.userRole);
    } else if (event is Logout) {
      yield state.copyWith(isLoading: false, isLogged: false, userRole: "", user: "");
    }
  }
}
