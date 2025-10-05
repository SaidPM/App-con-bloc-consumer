import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/carlbloc_bloc.dart';
import '../bloc/carlbloc_event.dart';
import '../bloc/carlbloc_state.dart';
import 'failureview.dart';
import 'loadingview.dart';

class Succes extends StatelessWidget {
  const Succes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarBlocBloc()..add(Cargardata()),
      child: BlocBuilder<CarBlocBloc, CarBlocState>(
        builder: (context, state) {
          if (state is LoadLoading) {
            return const LoadingView();
          } else if (state is LoadSuccess) {
            final data = state.data;
            return Center(
              child: Card(
                elevation: 12,
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF43E97B), 
                        Color(0xFF38F9D7),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Icon(Icons.emoji_events, color: Colors.white, size: 48),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          '¡Datos del Vehículo!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Divider(color: Colors.white70, thickness: 1.2),
                      ListTile(
                        leading: const Icon(Icons.directions_car, color: Colors.white),
                        title: Text(
                          'Modelo: ${data['modelo'] ?? ''}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.calendar_today, color: Colors.white),
                        title: Text(
                          'Año: ${data['año'] ?? ''}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.color_lens, color: Colors.white),
                        title: Text(
                          'Color: ${data['color'] ?? ''}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.attach_money, color: Colors.white),
                        title: Text(
                          'Precio: ${data['precio'] ?? ''}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is LoadFailure) {
            return const FailureView();
          } else {
            return const LoadingView();
          }
        },
      ),
    );
  }
}
