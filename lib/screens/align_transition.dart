import 'package:flutter/material.dart';

class AlignAnimationWidget extends StatefulWidget {
  @override
  _AlignAnimationWidgetState createState() => _AlignAnimationWidgetState();
}

class _AlignAnimationWidgetState extends State<AlignAnimationWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<AlignmentGeometry> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<AlignmentGeometry>(
            begin: Alignment.topLeft, end: Alignment.topRight)
        .animate(_animationController);
    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AlignTransition(
      alignment: _animation,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.blue[100]),
        child: SizedBox(
          height: 100,
          width: 100,
        ),
      ),
    );
  }

  Widget _container() {
    return Container(
      color: Colors.blue[100],
      width: 200,
      height: 200,
    );
  }
}
