import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'carlbloc_event.dart';
part 'carlbloc_state.dart';

class CarlblocBloc extends Bloc<CarlblocEvent, CarlblocState> {
  CarlblocBloc() : super(CarlblocInitial()) {
    on<Carconse>(_infocarro);
  }

  static const String _apiUrl = 'https://mocki.io/v1/fb361419-5a2a-46e9-a2be-8f766ca230d6';

  Future<void> _infocarro(Carconse event, Emitter<CarlblocState> emit) async {
    emit(CarlblocLoading());
    
    try {
      final response = await http.get(
        Uri.parse(_apiUrl),
      );
      
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final carData = {
          'modelo': jsonData['modelo']?.toString() ?? 'Desconocido',
          'año': jsonData['año']?.toString() ?? 'N/A',
          'color': jsonData['color']?.toString() ?? 'N/A',
          'precio': jsonData['precio']?.toString() ?? 'N/A',
        };
        emit(CarlblocSuccess(carData));
      } else {
        throw Exception('Error HTTP: ${response.statusCode}');
      }
    } catch (e) {
      emit(CarlbloFailure(e.toString()));
    }
  }


}