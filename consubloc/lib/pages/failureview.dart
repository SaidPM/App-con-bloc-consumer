import 'package:flutter/material.dart';

class FailureView extends StatelessWidget {
  const FailureView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF8D7DA),
      body: Center(
        child: Text(
          "Ocurrió un error",
          style: TextStyle(
            color: Color(0xFF721C24),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}