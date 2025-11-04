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
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            animationController.forward();
          },
          child: const Text('Toggle Animation'),
        ),
      ],
    );
  }
}
