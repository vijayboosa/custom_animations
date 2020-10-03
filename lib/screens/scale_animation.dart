import 'package:flutter/material.dart';

class ScaleAnimationWidget extends StatefulWidget {
  @override
  _ScaleAnimationWidgetState createState() => _ScaleAnimationWidgetState();
}

class _ScaleAnimationWidgetState extends State<ScaleAnimationWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _animationController,
        child: Text(
          'Scale Transition',
          style: TextStyle(
            fontSize: 26.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
