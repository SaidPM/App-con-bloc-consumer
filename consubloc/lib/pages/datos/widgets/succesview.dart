import 'package:flutter/material.dart';

class Succes extends StatelessWidget {
  final Map<String, dynamic> data;

  const Succes({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 12,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              colors: [Color(0xFF43E97B), Color(0xFF38F9D7)],
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
              const SizedBox(height: 6),
              Center(
                child: Text(
                  '¡Datos del Vehículo!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Divider(color: Colors.white70, thickness: 1.2),
              ListTile(
                leading: const Icon(Icons.directions_car, color: Colors.white),
                title: Text(
                  'Modelo: ${data['modelo'] ?? ''}',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today, color: Colors.white),
                title: Text(
                  'Año: ${data['año'] ?? ''}',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.color_lens, color: Colors.white),
                title: Text(
                  'Color: ${data['color'] ?? ''}',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.attach_money, color: Colors.white),
                title: Text(
                  'Precio: ${data['precio'] ?? ''}',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
