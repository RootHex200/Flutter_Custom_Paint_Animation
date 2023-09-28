

import 'dart:ui';

import 'package:flutter/material.dart';

class Discord extends StatefulWidget {
  const Discord({super.key});

  @override
  State<Discord> createState() => _DiscordState();
}

class _DiscordState extends State<Discord> with SingleTickerProviderStateMixin{
  Animation<double>? discordAnimation;
  AnimationController? discordController;

  AnimationController? shakeController;
  @override
  void initState() {
    discordController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    discordController!.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: discordController!,
        builder: (BuildContext context, Widget? child) {
          return CustomPaint(
              painter: DrawOwnLogo(progress: discordController!.value),
                  );
          },
      
      ),
    );
  }
}


class DrawOwnLogo extends CustomPainter{
  final double progress;
  const DrawOwnLogo({required this.progress});
  @override
  void paint(Canvas canvas, Size size) {
        Paint paint = Paint()
      ..strokeWidth = 3
      ..style=progress==1?PaintingStyle.fill:PaintingStyle.stroke
    
      ..color=progress==1?const Color(0xFF5964f2):Colors.black;
      
    Paint circle=Paint()
    ..style=PaintingStyle.fill
    ..color=Colors.white;

    Path path_0 = Path();

    path_0.moveTo(130, 400);
    //left side
    path_0.relativeQuadraticBezierTo(-30, 50, -10, 135);
    path_0.relativeLineTo(50, 15);
    path_0.relativeLineTo(6, -13);
    path_0.relativeLineTo(-30, -10);
    path_0.relativeLineTo(4, -5);

    //middle
    path_0.relativeQuadraticBezierTo(60, 20, 120, 0);

    //right side

      path_0.relativeLineTo(4, 6);
      path_0.relativeLineTo(-35, 10);
      path_0.relativeLineTo(7, 12);
      path_0.relativeLineTo(50, -15);
    path_0.relativeQuadraticBezierTo(20, -90, -10, -135);

    //top
    path_0.relativeLineTo(-45, -10);
    path_0.relativeLineTo(-5, 10);
    path_0.relativeLineTo(-50, 0);
    path_0.relativeLineTo(-7, -10);
    path_0.relativeLineTo(-49, 10);

    
    animatePath(path_0,paint , canvas, progress);
    progress==1? canvas.drawCircle(const Offset(160, 450), 20, circle):null;

    progress==1?canvas.drawCircle(const Offset(255, 450), 20, circle):null;
    
  }
  animatePath(Path path, Paint paint, Canvas canvas, double progress) {
    PathMetrics shadowMetrics = path.computeMetrics();
    for (PathMetric pathMetric in shadowMetrics) {
      Path extractPath = pathMetric.extractPath(
        0.0,
        pathMetric.length * progress,
      );
      canvas.drawPath(extractPath, paint);
    }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}