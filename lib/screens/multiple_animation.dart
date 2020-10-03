import 'package:flutter/material.dart';

class MultipleAniamtionWidget extends StatefulWidget {
  @override
  _MultipleAniamtionWidgetState createState() =>
      _MultipleAniamtionWidgetState();
}

class _MultipleAniamtionWidgetState extends State<MultipleAniamtionWidget>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  AnimationController _animationControllerTwo;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 3,
      ),
    );
    _animationControllerTwo = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );
    _animationController.repeat(reverse: true);
    _animationControllerTwo.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _animationControllerTwo,
        child: RotationTransition(
          turns: _animationController,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue[100],
              border: Border(
                top: BorderSide(color: Colors.red, width: 2.0),
              ),
            ),
            child: SizedBox(
              height: 100,
              width: 100,
            ),
          ),
        ),
      ),
    );
  }
}
