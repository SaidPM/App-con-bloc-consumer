part of 'loginbloc_bloc.dart';

@immutable
sealed class LoginblocEvent {}

final class Veriflogin extends LoginblocEvent{
  final String email;
  final String password;

  Veriflogin({required this.email, required this.password});
}
