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
  Color beginTweenColor = Colors.red;
  Color endTweenColor = Colors.red;
  Color animatedContainerColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    ///if there is something can be built with animated foo widgets so go with it better
    ///else you can use tween aniamtion builder
    return Column(
      children: [
        AnimatedContainer(
          height: 100,
          color: animatedContainerColor,
          width: 200,
          duration: Duration(
            seconds: 1,
          ),
          child: const Text(
            'Animated Container',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TweenAnimationBuilder<Color?>(
          tween: ColorTween(
            begin: beginTweenColor,
            end: endTweenColor,
          ),
          duration: Duration(seconds: 2),
          builder: (context, value, child) {
            return Container(
              color: value,
              height: 100,
              width: 200,
              child: const Text(
                'Tween Animation ',
                style: TextStyle(fontSize: 30, color: Colors.white),
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
              if (animatedContainerColor == Colors.blue) {
                animatedContainerColor = Colors.red;
              } else {
                animatedContainerColor = Colors.blue;
              }
              if (beginTweenColor == Colors.red &&
                  endTweenColor == Colors.red) {
                beginTweenColor = Colors.red;
                endTweenColor = Colors.green;
              } else if (beginTweenColor == Colors.red &&
                  endTweenColor == Colors.green) {
                beginTweenColor = Colors.green;
                endTweenColor = Colors.red;
              } else if (beginTweenColor == Colors.red &&
                  endTweenColor == Colors.green) {
                beginTweenColor = Colors.green;
                endTweenColor = Colors.red;
              } else if (beginTweenColor == Colors.green &&
                  endTweenColor == Colors.red) {
                beginTweenColor = Colors.red;
                endTweenColor = Colors.green;
              }
              log('begin: $beginTweenColor , end: $endTweenColor');
            });
          },
          child: Text('Animate Colors'),
        ),
      ],
    );
  }
}
