import 'dart:math';
import 'package:flutter/material.dart';
import 'package:timer/widgets/Models/time_model.dart';

class ClockPainter extends CustomPainter {
  // set the time patrameter
  TimeModel? time;
  ClockPainter({required this.time});

  @override
  void paint(Canvas canvas, Size size) {
    // calculate the time position
    double secRec = ((pi / 2) - (pi / 30) * this.time!.sec!) % (2 * pi);
    double minRec = ((pi / 2) - (pi / 30) * this.time!.min!) % (2 * pi);
    double hourRec = ((pi / 2) - (pi / 6) * this.time!.hour!) % (2 * pi);

    // set some variable to build clock
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    // setting the clock coordinate
    var secHeight = radius / 2;
    var minHeight = radius / 2 - 10;
    var hourHeight = radius / 2 - 25;

    var seconds = Offset(
        centerX + secHeight * cos(secRec), centerY - secHeight * sin(secRec));
    var minitus = Offset(
        centerX + minHeight * cos(minRec), centerY - minHeight * sin(minRec));
    var hours = Offset(centerX + hourHeight * cos(hourRec),
        centerY - hourHeight * sin(hourRec));

    // setting the Brush
    var fillBrush = Paint()
      ..color = Colors.blueAccent
      ..strokeCap = StrokeCap.round;
      
    var CenterDotBrush = Paint()..color = Color(0xFFEAECFF);

    //setting the hand Brush

    var secBrush = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2
      ..strokeJoin = StrokeJoin.round;

    var minBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3
      ..strokeJoin = StrokeJoin.round;

    var hourBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4
      ..strokeJoin = StrokeJoin.round;

    // drawing the body
    canvas.drawCircle(center, radius - 20, fillBrush);

    //drawing the clock hands
    canvas.drawLine(center, seconds, secBrush);
    canvas.drawLine(center, minitus, minBrush);
    canvas.drawLine(center, hours, hourBrush);

    //drawing the center of clock
    canvas.drawCircle(center, 10, CenterDotBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
