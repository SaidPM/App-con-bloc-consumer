part of 'cubitlogin_cubit.dart';

@immutable
sealed class CubitloginState {}

final class CubitloginInitial extends CubitloginState {}

final class CubitloginLoading extends CubitloginState {}

final class CubitloginSuccess extends CubitloginState {}

final class CubitloginFailure extends CubitloginState {}
