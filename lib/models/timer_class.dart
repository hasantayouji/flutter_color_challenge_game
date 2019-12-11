import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  Timer({this.value, this.onEnd, this.width});
  final VoidCallback onEnd;
  final double width;
  final int value;
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> with TickerProviderStateMixin {
  Animation _animate;

  @override
  void initState() {
    super.initState();
    _animate = StepTween(begin: widget.value, end: 0).animate(
        AnimationController(
            duration: Duration(seconds: widget.value), vsync: this)
          ..forward(from: 0.0))
      ..addStatusListener((AnimationStatus s) {
        if (s == AnimationStatus.completed) widget.onEnd();
      });
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: _animate,
      builder: (BuildContext context, Widget child) => setText(
          _animate.value.toString().padLeft(2, '0'),
          widget.width * 0.12,
          Colors.green));

  setText(text, size, color) => Text(text,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none));
}
