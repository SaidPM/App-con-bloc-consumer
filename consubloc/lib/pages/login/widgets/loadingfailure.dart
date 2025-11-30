import 'package:flutter/material.dart';

class LoginFailureView extends StatelessWidget {
  const LoginFailureView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFFCDD2), // Fondo rojo claro diferente
      body: Center(
        child: Text(
          "Error al iniciar sesión, intenta de nuevo",
          style: TextStyle(
            color: Color(0xFFD32F2F),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
