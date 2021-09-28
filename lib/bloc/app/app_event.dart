part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class LoadApp extends AppEvent {}

class Login extends AppEvent {

  Login();
}

class LoginLoading extends AppEvent {

  LoginLoading();
}

class Logged extends AppEvent {
  final String user;
  final String userRole;

  Logged({ required this.user, required this.userRole});
}

class Logout extends AppEvent {
  Logout();
}
