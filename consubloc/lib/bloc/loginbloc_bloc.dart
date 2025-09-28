import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'loginbloc_event.dart';
part 'loginbloc_state.dart';

class LoginblocBloc extends Bloc<LoginblocEvent, LoginblocState> {
  LoginblocBloc() : super(LoginblocInitial()) {
    on<LoginblocEvent>(_iniciologin);
  }

  Future<void> _iniciologin(LoginblocEvent event, Emitter<LoginblocState> emit) async {
    emit(LoginblocLoading());
    
    try {
      final url = Uri.parse('https://mocki.io/v1/fb361419-5a2a-46e9-a2be-8f766ca230d6');
      final response = await http.get(url);
      
      if (response.statusCode == 200) {
          emit(LoginblocSuccess());}
        else {
          throw Exception('Autenticación fallida: respuesta inválida');
    }} catch (e) {
      emit(LoginblocFailure(e.toString()));
    }
  }
}