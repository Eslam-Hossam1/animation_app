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
              CustomFooTransition(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomFooTransition extends StatefulWidget {
  const CustomFooTransition({
    super.key,
  });

  @override
  State<CustomFooTransition> createState() => _CustomFooTransitionState();
}

class _CustomFooTransitionState extends State<CustomFooTransition>
    with SingleTickerProviderStateMixin {
  late Animation<double> scaleAnimation;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
    scaleAnimation = Tween<double>(begin: .5, end: 2).animate(
      animationController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScaleTransition(
          scale: scaleAnimation,
          child: FlutterLogo(
            size: 100,
          ),
        ),
        const SizedBox(height: 100),
        Wrap(
          children: [
            ElevatedButton(
              onPressed: () {
                animationController.forward();
              },
              child: const Text('forward'),
            ),
            ElevatedButton(
              onPressed: () {
                animationController.reverse();
              },
              child: const Text('reverse'),
            ),
            ElevatedButton(
              onPressed: () {
                animationController.reset();
              },
              child: const Text('reset'),
            ),
            ElevatedButton(
              onPressed: () {
                animationController.repeat(reverse: true);
              },
              child: const Text('repeat reverse'),
            ),
            ElevatedButton(
              onPressed: () {
                animationController.repeat();
              },
              child: const Text('repeat without reverse'),
            ),
            ElevatedButton(
              onPressed: () {
                animationController.stop();
              },
              child: const Text('stop'),
            ),
            ElevatedButton(
              onPressed: () {
                scaleAnimation.addListener(
                  customScaleAnimationListner,
                );
                animationController.addListener(
                  customAnimationControllerListner,
                );
              },
              child: const Text('add listeners'),
            ),
            ElevatedButton(
              onPressed: () {
                animationController
                    .removeListener(customAnimationControllerListner);
                animationController.removeListener(customScaleAnimationListner);
              },
              child: const Text('remove listeners'),
            ),
          ],
        ),
      ],
    );
  }
}
