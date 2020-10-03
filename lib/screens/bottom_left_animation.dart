import 'package:flutter/material.dart';

class BottomLeftAnimation extends StatefulWidget {
  @override
  BottomLeftAnimationState createState() => BottomLeftAnimationState();
}

class BottomLeftAnimationState extends State<BottomLeftAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  // Animation<double> _widthTween;

  Animation<Offset> _textOffset;
  Animation<Offset> _textOffsetTwo;
  Animation<Offset> _topContainerOffset;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    // _widthTween =
    //     Tween<double>(begin: 0, end: 200).animate(_animationController);

    _textOffset =
        Tween<Offset>(begin: Offset(0.5, 0), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _textOffsetTwo =
        Tween<Offset>(begin: Offset(0.5, 0), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.2, 1.0, curve: Curves.easeOut),
      ),
    );

    _topContainerOffset =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(1, 0)).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward();
    // _animationController.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: EdgeInsets.only(
            left: 20.0,
            bottom: 20.0,
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(5.0),
          ),
          height: 70,
          width: 200,
          child: Stack(
            children: [
              SlideTransition(
                position: _topContainerOffset,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: _textOffset,
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 10.0,
                      ),
                      child: Text(
                        'Vijay Developer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: _textOffsetTwo,
                    child: Container(
                      child: Text(
                        'Flutter, Django',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
