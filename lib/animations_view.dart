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

class CustomTweenAnimationBuilder extends StatelessWidget {
  const CustomTweenAnimationBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(
        begin: 0,
        end: 100,
      ),
      duration: Duration(seconds: 2),
      builder: (context, value, child) {
        return Text(
          '$value',
          style: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}
