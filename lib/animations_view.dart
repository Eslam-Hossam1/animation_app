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
  late Animation<double> containerScaleAnimation;
  late AnimationController containerAnimationController;
  @override
  void initState() {
    super.initState();
    initAnimations();
  }

  void initAnimations() {
    initContainerAnimation();
  }

  void initContainerAnimation() {
    containerAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 2),
    );

    containerScaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(containerAnimationController);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: SizeTransition(
            axis: Axis.horizontal,
            //  axisAlignment: ,
            sizeFactor: containerScaleAnimation,
            child: Container(width: 200, height: 100, color: Colors.purple),
          ),
        ),
        const SizedBox(height: 100),
        Wrap(
          children: [
            ElevatedButton(
              onPressed: () {
                containerAnimationController.forward();
              },
              child: const Text('forward container'),
            ),

            ElevatedButton(
              onPressed: () {
                containerAnimationController.reverse();
              },
              child: const Text('reverse container'),
            ),
            ElevatedButton(
              onPressed: () {
                containerAnimationController.stop();
              },
              child: const Text('stop container'),
            ),
            ElevatedButton(
              onPressed: () {
                containerAnimationController.reset();
              },
              child: const Text('reset container'),
            ),
          ],
        ),
      ],
    );
  }
}
