import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'loginbloc_event.dart';
import 'loginbloc_state.dart';

class BlocLoginBloc extends Bloc<BlocLoginEvent, BlocLoginState> {
  BlocLoginBloc() : super(HomeInitial()) {
    on<IniciarSesion>((event, emit) async {
      emit(HomeLoading());
    
      final url = "https://jsonplaceholder.typicode.com/posts";

      try{
        final response = await http.get(Uri.parse(url)
        );

        if (response.statusCode == 200) {
          emit(HomeSuccess());
        } else {
          emit(HomeFailure());
        }
      } catch (e) {
        emit(HomeFailure());
      }
    });
  }
}
