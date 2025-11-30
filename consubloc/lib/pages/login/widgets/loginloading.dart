import 'package:flutter/material.dart';

class LoginLoadingView extends StatelessWidget {
  const LoginLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFC8E6C9), // Fondo verde claro
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                strokeWidth: 4,
                color: Colors.green, // Color verde para el indicador
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Iniciando sesión...",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                // Texto en verde oscuro
              ),
            ),
          ],
        ),
      ),
    );
  }
}
