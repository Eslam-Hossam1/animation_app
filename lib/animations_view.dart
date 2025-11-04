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
  int begin = 0;
  int end = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder<int>(
          tween: IntTween(
            begin: begin,
            end: end,
          ),
          child: const FlutterLogo(
            size: 100,
          ),
          duration: Duration(seconds: 2),
          builder: (context, value, child) {
            return Column(
              children: [
                child!,
                Text(
                  '$value',
                  style: const TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              if (begin == 0 && end == 100) {
                begin = 100;
                end = 0;
              } else {
                begin = 0;
                end = 100;
              }
            });
          },
          child: Text('Animate to ${100}'),
        ),
      ],
    );
  }
}
