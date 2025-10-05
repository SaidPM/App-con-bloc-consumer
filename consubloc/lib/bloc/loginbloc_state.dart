import 'package:equatable/equatable.dart';

sealed class BlocLoginState extends Equatable {
  const BlocLoginState();
  
  @override
  List<Object> get props => [];
}

class HomeInitial extends BlocLoginState {}
class HomeLoading extends BlocLoginState {}
class HomeSuccess extends BlocLoginState {}
class HomeFailure extends BlocLoginState {}