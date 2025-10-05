import 'package:equatable/equatable.dart';

sealed class CarBlocState extends Equatable {
  const CarBlocState();
  
  @override
  List<Object> get props => [];
}


class LoadInitial extends CarBlocState {}
class LoadLoading extends CarBlocState {}
class LoadSuccess extends CarBlocState {
  final Map<String, dynamic> data;
  const LoadSuccess(this.data);

  @override
  List<Object> get props => [data];
}
class LoadFailure extends CarBlocState {}