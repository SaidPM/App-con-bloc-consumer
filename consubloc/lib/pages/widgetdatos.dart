import 'package:flutter/material.dart';
import 'succesview.dart';

class Suceso extends StatelessWidget {
  const Suceso({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/camry.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            Container(
              height: 450,
              width: 600,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.transparent, width: 0),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 16,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: const Succes(),
            ),
          ],
        ),
      ),
    );
  }
}
