part of 'car_bloc_bloc.dart';

sealed class CarBlocEvent extends Equatable {
  const CarBlocEvent();

  @override
  List<Object> get props => [];
}

final class Cargardata extends CarBlocEvent {}
