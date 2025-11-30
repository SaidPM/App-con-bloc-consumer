import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'cubitlogin_state.dart';

class CubitloginCubit extends Cubit<CubitloginState> {
  CubitloginCubit() : super(CubitloginInitial());

  Future<void> iniciarSesion(String correo, String contrasena) async {
    emit(CubitloginLoading());
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    try{
      final response = await http.post(
        url,
        body: {"correo": correo, "contraseña": contrasena},
      );

      if (response.statusCode == 201) {
        emit(CubitloginSuccess());
      } else {
        emit(CubitloginFailure());
      }
    } catch (e) {
      emit(CubitloginFailure());
    }
  }
}
