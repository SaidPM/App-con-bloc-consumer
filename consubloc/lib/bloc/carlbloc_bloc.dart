import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'carlbloc_event.dart';
import 'carlbloc_state.dart';

class CarBlocBloc extends Bloc<CarBlocEvent, CarBlocState> {
  CarBlocBloc() : super(LoadInitial()) {
    on<Cargardata>((event, emit) async {
      emit(LoadLoading());

      final url = "https://mocki.io/v1/fb361419-5a2a-46e9-a2be-8f766ca230d6";

      try {
        final response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          emit(LoadSuccess(json.decode(response.body)));
        } else {
          emit(LoadFailure());
        }
      } catch (e) {
        emit(LoadFailure());
      }
    });
  }
}
