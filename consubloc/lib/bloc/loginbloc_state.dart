part of 'loginbloc_bloc.dart';

@immutable
sealed class LoginblocState {}

final class LoginblocInitial extends LoginblocState {}

final class LoginblocLoading extends LoginblocState{}

final class LoginblocSuccess extends LoginblocState{}

final class LoginblocFailure extends LoginblocState{
  final String error;
  LoginblocFailure(this.error);
}
