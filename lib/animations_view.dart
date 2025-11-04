import 'dart:developer';

import 'package:flutter/material.dart';

class AnimationsView extends StatefulWidget {
  const AnimationsView({super.key});

  @override
  State<AnimationsView> createState() => _AnimationsViewState();
}

class _AnimationsViewState extends State<AnimationsView> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTweenAnimationBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTweenAnimationBuilder extends StatefulWidget {
  const CustomTweenAnimationBuilder({
    super.key,
  });

  @override
  State<CustomTweenAnimationBuilder> createState() =>
      _CustomTweenAnimationBuilderState();
}

class _CustomTweenAnimationBuilderState
    extends State<CustomTweenAnimationBuilder> {
  double animatedOpacityValue = 1;
  double tweenOpacityEnd = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedOpacity(
          opacity: animatedOpacityValue,
          duration: Duration(
            seconds: 1,
          ),
          child: Container(
            color: Colors.blue,
            height: 100,
            width: 200,
            child: const Text(
              'Animated Container',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TweenAnimationBuilder<double?>(
          tween: Tween<double>(
            begin: 0,
            end: tweenOpacityEnd,
          ),
          duration: Duration(seconds: 1),
          builder: (context, value, child) {
            return Opacity(
              opacity: value!,
              child: Container(
                color: Colors.purple,
                height: 100,
                width: 200,
                child: const Text(
                  'Tween Animation ',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              animatedOpacityValue == 0
                  ? animatedOpacityValue = 1.0
                  : animatedOpacityValue = 0;
              tweenOpacityEnd == 0
                  ? tweenOpacityEnd = 1.0
                  : tweenOpacityEnd = 0;
            });
          },
          child: Text('Animate opacity'),
        ),
      ],
    );
  }
}
