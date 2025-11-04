import 'dart:ui';

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
  Color animatedContainerColor = Colors.blue;
  double animatedContainerWidth = 50;
  double animatedContainerHeight = 50;
  MyCustomTweenModel tweenEndModel = MyCustomTweenModel(
    color: Colors.blue,
    width: 50,
    height: 50,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(seconds: 1),
          color: animatedContainerColor,
          height: animatedContainerHeight,
          width: animatedContainerWidth,
          child: const Text(
            'Animated Container',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TweenAnimationBuilder<MyCustomTweenModel>(
          tween: MyCustomTween(
            begin: MyCustomTweenModel(
              color: Colors.yellow,
              width: 50,
              height: 50,
            ),
            end: tweenEndModel,
          ),
          duration: Duration(seconds: 1),
          builder: (context, value, child) {
            return Container(
              color: value.color,
              height: value.height,
              width: value.width,
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
                animatedContainerColor = Colors.green;
                animatedContainerWidth = 200;
                animatedContainerHeight = 200;
              } else {
                animatedContainerColor = Colors.blue;
                animatedContainerWidth = 50;
                animatedContainerHeight = 50;
              }
              if (tweenEndModel.color == Colors.blue) {
                tweenEndModel = MyCustomTweenModel(
                  color: Colors.purple,
                  width: 200,
                  height: 200,
                );
              } else {
                tweenEndModel = MyCustomTweenModel(
                  color: Colors.blue,
                  width: 50,
                  height: 50,
                );
              }
            });
          },
          child: Text('Animate Colors'),
        ),
      ],
    );
  }
}

class MyCustomTweenModel {
  final Color color;
  final double width;
  final double height;
  MyCustomTweenModel({
    required this.color,
    required this.width,
    required this.height,
  });
  static MyCustomTweenModel lerp(
    MyCustomTweenModel begin,
    MyCustomTweenModel end,
    double t,
  ) {
    return MyCustomTweenModel(
      color: Color.lerp(begin.color, end.color, t)!,
      width: lerpDouble(begin.width, end.width, t)!,
      height: lerpDouble(begin.height, end.height, t)!,
    );
  }
}

class MyCustomTween extends Tween<MyCustomTweenModel> {
  MyCustomTween({super.begin, super.end});
  @override
  MyCustomTweenModel lerp(double t) => MyCustomTweenModel.lerp(begin!, end!, t);
}
