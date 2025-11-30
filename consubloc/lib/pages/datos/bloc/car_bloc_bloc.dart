import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
part 'car_bloc_event.dart';
part 'car_bloc_state.dart';

class CarBlocBloc extends Bloc<CarBlocEvent, CarBlocState> {
  CarBlocBloc() : super(LoadInitial()) {
    on<Cargardata>((event, emit) async {
      emit(LoadLoading());
      await Future.delayed(const Duration(seconds: 2));
      final url = Uri.parse("https://mocki.io/v1/7b4a864e-0a6f-4c9a-a646-7070578661b9");

      try{
        final response = await http.get(url);

        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);
          emit(LoadSuccess(data));
        } else {
          emit(LoadFailure());
        }
      } catch(e){
        emit(LoadFailure());
      }
    });
  }
}
