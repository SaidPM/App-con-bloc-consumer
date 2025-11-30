import 'package:dioapp/pages/datos/datos.dart';
import 'package:dioapp/pages/datos/widgets/dise%C3%B1o.dart';
import 'package:flutter/material.dart';

class Suceso extends StatelessWidget {
  const Suceso({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Luchito(),
            Positioned(
              top: 20,
              left: 30,
              right: 30,
              child: Image.asset('assets/camry.png', width: 150, height: 150),
            ),
            const SizedBox(height: 20),
            Positioned(
              top: 180,
              left: 90,
              right: 90,
              child: Container(
                height: 470,
                width: 520,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.transparent, width: 0),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Datos(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
