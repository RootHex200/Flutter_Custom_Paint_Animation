
import 'dart:math';
import 'package:flutter/material.dart';

class SolorAnimation extends StatefulWidget {
  const SolorAnimation({super.key});

  @override
  State<SolorAnimation> createState() => _SolorAnimationState();
}

class _SolorAnimationState extends State<SolorAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 10), upperBound: pi * 2);
    _controller.addListener(() {
      setState(() {});
    });

    _controller.forward();
    _controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomPaint(
        painter: SolorPaint(animation: _controller),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}

class SolorPaint extends CustomPainter {
  final Animation<double> animation;
  SolorPaint({required this.animation});
  @override
  void paint(Canvas canvas, Size size) {
    Paint firstround = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke..strokeWidth = 5;
    Paint thirdround = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;
    Paint secondround = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke;
    Paint lastround = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke;

    Paint firstboll = Paint()..color = Colors.yellow;
    Paint secondboll = Paint()..color = Colors.red;
    Paint thirdboll = Paint()..color = Colors.grey;
    Paint lastboll = Paint()..color = Colors.blue;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 40, firstround);
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), 90, secondround);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 130, thirdround);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 180, lastround);

    canvas.drawCircle(
        Offset(size.width / 2 + 40 * cos(animation.value),
            size.height / 2 + 40 * sin(animation.value)),
        20,
        firstboll);

    canvas.drawCircle(
        Offset(size.width / 2 + 90 * cos(animation.value + 1),
            size.height / 2 + 90 * sin(animation.value + 1)),
        20,
        secondboll);

    canvas.drawCircle(
        Offset(size.width / 2 + 130 * cos(animation.value + 1.99),
            size.height / 2 + 130 * sin(animation.value + 1.99)),
        20,
        thirdboll);
    canvas.drawCircle(
        Offset(size.width / 2 + 180 * cos(animation.value + 3.00),
            size.height / 2 + 180 * sin(animation.value + 3.00)),
        20,
        lastboll);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
