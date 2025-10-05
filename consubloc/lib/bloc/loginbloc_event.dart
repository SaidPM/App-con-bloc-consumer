import 'package:equatable/equatable.dart';

sealed class BlocLoginEvent extends Equatable {
  const BlocLoginEvent();

  @override
  List<Object> get props => [];
}

final class IniciarSesion extends BlocLoginEvent {
  final String correo;
  final String contrasena;

  const IniciarSesion(this.correo,this.contrasena);

  @override
  List<Object> get props => [correo, contrasena];
}