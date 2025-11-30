import 'package:flutter/material.dart';

void main() {
  runApp(Luchito());
}

class Luchito extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: CustomPaint(painter: Jackin()),
            ),
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: CustomPaint(painter: Adrian()),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 100,
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: CustomPaint(painter: WavePainter()),
              ),
            ),
          ],
        ),
      ),
    );
    // SizedBox(
    //   height: double.infinity,
    //   width: double.infinity,
    //   child: CustomPaint(painter: Jackin()),
    // );
  }
}

class Jackin extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final marcador = Paint();
    marcador.color = Color(0xFF43E97B);
    marcador.style = PaintingStyle.fill;
    marcador.strokeWidth = 5;

    final path = Path();
    path.lineTo(0, size.height * 0.30);
    path.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.1,
      size.width * 0.3,
      size.height * 0.6,
    );
    path.quadraticBezierTo(
      size.width * 0.4,
      size.height * 0.9,
      size.width * 0.7,
      size.height * 0.6,
    );
    path.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.5,
      size.width,
      size.height * 0.8,
    );
    path.lineTo(size.width, 0);

    // path.lineTo(size.width * 0.1, size.height * 0.33);
    // path.lineTo(size.width * 0.7, size.height * 0.4);
    // path.lineTo(size.width, size.height * 0.2);
    // path.lineTo(size.width, 0);

    canvas.drawPath(path, marcador);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}

class Adrian extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pen = Paint();
    pen.color = Colors.blue;
    pen.style = PaintingStyle.fill;
    pen.strokeWidth = 5;

    final path = Path();
    path.lineTo(0, size.height * 0.30);

    path.lineTo(size.width * 0.1, size.height * 0.33);
    path.lineTo(size.width * 0.7, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, pen);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0); // Comienza desde la parte superior del área asignada
    const waveHeight = 22.0; // Altura de las mini  olas
    const waveCount = 20; // Número de olas
    const waveWidth = 100.0; // Ancho de cada ola

    for (int i = 0; i < waveCount; i++) {
      final startX = i * waveWidth;
      path.quadraticBezierTo(
        startX + waveWidth * 0.25,
        waveHeight,
        startX + waveWidth * 0.5,
        0,
      );
      path.quadraticBezierTo(
        startX + waveWidth * 0.75,
        -waveHeight,
        startX + waveWidth,
        0,
      );
    }
    path.lineTo(size.width, 0); // Cierra la parte superior
    path.lineTo(size.width, 100); // Baja a la parte inferior del área
    path.lineTo(0, 100); // Cierra el path
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
