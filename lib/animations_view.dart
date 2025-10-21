import 'dart:developer';

import 'package:flutter/material.dart';

class AnimationsView extends StatefulWidget {
  const AnimationsView({super.key});

  @override
  State<AnimationsView> createState() => _AnimationsViewState();
}

class _AnimationsViewState extends State<AnimationsView> {
  bool isValuesChanged = false;
  Color color = Colors.red;
  double width = 50;
  double height = 50;
  @override
  Widget build(BuildContext context) {
    /// Animated Container
    /// is a widget where you can animate the container based on changable properties during time
    /// any property
    /// onEnd is a method which invoked after animation ends
    /// you can change the default Curve.linear to any curve, to help choose see the docs at https://api.flutter.dev/flutter/animation/Curves-class.html
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: width,
              height: height,
              color: color,
              onEnd: () {
                log('animation end');
              },
              duration: Duration(
                seconds: 1,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (isValuesChanged) {
                  isValuesChanged = false;
                  width = 50;
                  height = 50;
                  color = Colors.red;
                } else {
                  isValuesChanged = true;
                  width = 200;
                  height = 200;
                  color = Colors.green;
                }
                setState(() {});
              },
              child: Text('Start Animation'),
            )
          ],
        ),
      ),
    );
  }
}
