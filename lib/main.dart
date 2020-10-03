import 'package:custom_animations/screens/align_transition.dart';
import 'package:custom_animations/screens/bottom_left_animation.dart';
import 'package:custom_animations/screens/multiple_animation.dart';
import 'package:custom_animations/screens/scale_animation.dart';
import 'package:custom_animations/screens/second_align_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: BottomLeftAnimation(),
        appBar: AppBar(
          title: Text('Custom Animation'),
        ),
      ),
    );
  }
}

class AnimationContrallerExample extends StatefulWidget {
  @override
  _AnimationContrallerExampleState createState() =>
      _AnimationContrallerExampleState();
}

class _AnimationContrallerExampleState extends State<AnimationContrallerExample>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Tween<double> _widthTween = Tween<double>(begin: 200.0, end: 400.0);
  Animatable<double> _curedTween = Tween<double>(begin: 200.0, end: 400.0)
      .chain(CurveTween(curve: Curves.easeOut));
  double _width = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _controller.addListener(() {
      // print(_controller.value);
      setState(() {});
      // _setWidth(_controller.value * 200);
    });
    _controller.addStatusListener((status) {
      print(status);
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward(); //to start the animation use _controller.forward
  }

  void _setWidth(double wi) {
    setState(() {
      _width = wi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: _curedTween.evaluate(_controller),
              height: 200.0,
              color: Colors.green,
            ),
          ],
        ),
        Row(
          children: [
            OutlineButton(
              onPressed: () {
                _controller.forward();
              },
              child: Text('loop'),
            ),
            OutlineButton(
              onPressed: () {
                _controller.stop();
              },
              child: Text('stop'),
            ),
          ],
        ),
      ],
    );
  }
}
