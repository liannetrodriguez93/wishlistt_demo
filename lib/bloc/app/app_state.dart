part of 'app_bloc.dart';

@immutable
class AppState {
  final bool isLoading;
  final bool isLogged;
  final String userRole;
  final String user;

  const AppState({this.isLoading = false, this.isLogged = false, this.userRole = "", this.user = ""});

  AppState copyWith({bool? isLoading, bool? isLogged, String? userRole, String? user}) => AppState(
        isLoading: isLoading ?? this.isLoading,
        isLogged: isLogged ?? this.isLogged,
        userRole: userRole ?? this.userRole,
        user: user ?? this.user,
      );
}
