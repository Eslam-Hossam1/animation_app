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
  late Animation<double> flutterLogoScaleAnimation;
  late AnimationController flutterLogoAnimationController;
  late Animation<double> containerScaleAnimation;
  late AnimationController containerAnimationController;
  @override
  void initState() {
    super.initState();
    initAnimations();
  }

  void initAnimations() {
    initFlutterLogoAnimation();
    initContainerAnimation();
  }

  void initContainerAnimation() {
    containerAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    containerScaleAnimation = Tween<double>(
      begin: .5,
      end: 2,
    ).animate(containerAnimationController);
  }

  void initFlutterLogoAnimation() {
    flutterLogoAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    flutterLogoScaleAnimation = Tween<double>(
      begin: .5,
      end: 2,
    ).animate(flutterLogoAnimationController);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScaleTransition(
          scale: flutterLogoScaleAnimation,
          child: FlutterLogo(size: 100),
        ),
        ScaleTransition(
          scale: containerScaleAnimation,
          child: Container(width: 200, height: 100, color: Colors.purple),
        ),
        const SizedBox(height: 100),
        Wrap(
          children: [
            ElevatedButton(
              onPressed: () {
                flutterLogoAnimationController.forward();
              },
              child: const Text('forward logo'),
            ),
            ElevatedButton(
              onPressed: () {
                containerAnimationController.forward();
              },
              child: const Text('forward container'),
            ),
            ElevatedButton(
              onPressed: () {
                flutterLogoAnimationController.reverse();
              },
              child: const Text('reverse logo'),
            ),
            ElevatedButton(
              onPressed: () {
                containerAnimationController.reverse();
              },
              child: const Text('reverse container'),
            ),
          ],
        ),
      ],
    );
  }
}
