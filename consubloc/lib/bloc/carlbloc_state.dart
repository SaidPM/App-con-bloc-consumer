part of 'carlbloc_bloc.dart';

@immutable
sealed class CarlblocState {}

final class CarlblocInitial extends CarlblocState {}

final class CarlblocLoading extends CarlblocState {}

final class CarlblocSuccess extends CarlblocState {
  final Map<String, String> carData;
  CarlblocSuccess(this.carData);
}

final class CarlbloFailure extends CarlblocState {
  final String error;
  CarlbloFailure(this.error);
}


