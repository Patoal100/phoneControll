import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.lightBlue[100]!
      ..style = PaintingStyle.fill;

    var paint2 = Paint()
      ..color = Colors.lightBlue[200]!
      ..style = PaintingStyle.fill;

    // Dibuja los círculos que forman la nube
    canvas.drawCircle(
        Offset(size.width * 0.0, size.height * 0.5), size.width * 0.08, paint);

    // Dibuja los círculos que forman la nube
    canvas.drawCircle(
        Offset(size.width * 0.1, size.height * 0.5), size.width * 0.08, paint2);
    canvas.drawCircle(
        Offset(size.width * 0.2, size.height * 0.5), size.width * 0.09, paint2);
    canvas.drawCircle(
        Offset(size.width * 0.3, size.height * 0.5), size.width * 0.08, paint2);

    // Dibuja los círculos que forman la nube
    canvas.drawCircle(
        Offset(size.width * 0.3, size.height * 0.5), size.width * 0.05, paint);
    canvas.drawCircle(
        Offset(size.width * 0.4, size.height * 0.5), size.width * 0.075, paint);
    canvas.drawCircle(
        Offset(size.width * 0.5, size.height * 0.5), size.width * 0.05, paint);

    // Dibuja los círculos que forman la nube
    canvas.drawCircle(
        Offset(size.width * 0.6, size.height * 0.5), size.width * 0.08, paint2);
    canvas.drawCircle(
        Offset(size.width * 0.7, size.height * 0.5), size.width * 0.09, paint2);
    canvas.drawCircle(
        Offset(size.width * 0.8, size.height * 0.5), size.width * 0.08, paint2);

    // Dibuja los círculos que forman la nube
    canvas.drawCircle(
        Offset(size.width * 0.8, size.height * 0.5), size.width * 0.05, paint);
    canvas.drawCircle(
        Offset(size.width * 0.9, size.height * 0.5), size.width * 0.075, paint);
    canvas.drawCircle(
        Offset(size.width * 1.0, size.height * 0.5), size.width * 0.05, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
