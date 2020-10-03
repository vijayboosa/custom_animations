import 'package:flutter/material.dart';

class SecondAlignAnimationWidget extends StatefulWidget {
  final Widget child;

  const SecondAlignAnimationWidget({Key key, this.child}) : super(key: key);

  @override
  _SecondAlignAnimationWidgetState createState() =>
      _SecondAlignAnimationWidgetState();
}

class _SecondAlignAnimationWidgetState extends State<SecondAlignAnimationWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, -1),
    ).animate(_animationController);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _animation, child: widget.child);
  }
}
