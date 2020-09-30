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
        body: AnimationContrallerExample(),
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

  double _width = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _controller.addListener(() {
      print(_controller.value);
      _setWidth(_controller.value * 200);
    });
    _controller.repeat(
        reverse: true); //to start the animation use _controller.forward
    print('Hello');
  }

  void _setWidth(double wi) {
    setState(() {
      _width = wi;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('called build function');
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: _width,
              height: 200.0,
              color: Colors.green,
            )
          ],
        ),
        Row(
          children: [
            OutlineButton(
              onPressed: () {},
              child: Text('loop'),
            ),
            OutlineButton(
              onPressed: () {},
              child: Text('stop'),
            ),
          ],
        ),
      ],
    );
  }
}
