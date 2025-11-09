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
            children: [CustomFooTransition()],
          ),
        ),
      ),
    );
  }
}

class CustomFooTransition extends StatefulWidget {
  const CustomFooTransition({super.key});

  @override
  State<CustomFooTransition> createState() => _CustomFooTransitionState();
}

class _CustomFooTransitionState extends State<CustomFooTransition>
    with TickerProviderStateMixin {
  late Animation<double> progressAnimation;
  late AnimationController progressAnimationController;
  @override
  void initState() {
    super.initState();
    initAnimations();
  }

  void initAnimations() {
    initContainerAnimation();
  }

  void initContainerAnimation() {
    progressAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      reverseDuration: const Duration(seconds: 2),
    );

    progressAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(progressAnimationController);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AnimatedBuilder(
            animation: progressAnimation,
            builder: (context, child) {
              return Column(
                children: [
                  Text(
                    'Progress: ${(progressAnimation.value * 100).toStringAsFixed(1)}%',
                    style: const TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(12),
                    minHeight: 20,
                    value: progressAnimation.value,
                    backgroundColor: Colors.red.withAlpha(50),
                    color: Colors.green,
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 100),
        Wrap(
          children: [
            ElevatedButton(
              onPressed: () {
                progressAnimationController.forward();
              },
              child: const Text('forward container'),
            ),

            ElevatedButton(
              onPressed: () {
                progressAnimationController.reverse();
              },
              child: const Text('reverse container'),
            ),
            ElevatedButton(
              onPressed: () {
                progressAnimationController.stop();
              },
              child: const Text('stop container'),
            ),
            ElevatedButton(
              onPressed: () {
                progressAnimationController.reset();
              },
              child: const Text('reset container'),
            ),
          ],
        ),
      ],
    );
  }
}
