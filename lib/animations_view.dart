import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: AnimationsView(),
    debugShowCheckedModeBanner: false,
  ));
}

class AnimationsView extends StatefulWidget {
  const AnimationsView({super.key});

  @override
  State<AnimationsView> createState() => _AnimationsViewState();
}

class _AnimationsViewState extends State<AnimationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: double.infinity,
            height: 400,
            child: Stack(
              children: const [CustomRocketTransition()],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomRocketTransition extends StatefulWidget {
  const CustomRocketTransition({super.key});

  @override
  State<CustomRocketTransition> createState() => _CustomRocketTransitionState();
}

class _CustomRocketTransitionState extends State<CustomRocketTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController rocketController;
  late Animation<CustomRocketTweenModel> rocketAnimation;

  @override
  void initState() {
    super.initState();

    rocketController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6), // Increased for 3 stages
    );

    // Define 3 stages using TweenSequence
    rocketAnimation = TweenSequence<CustomRocketTweenModel>([
      // Stage 1: Initial movement (0% to 40% of animation)
      TweenSequenceItem(
        tween: CustomRocketTween(
          begin: CustomRocketTweenModel(
            rocketSize: 1,
            rocketTurns: 0,
            bottom: 0,
            left: 50,
          ),
          end: CustomRocketTweenModel(
            rocketSize: 2,
            rocketTurns: 0.5,
            bottom: 300,
            left: 150,
          ),
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 40, // 40% of the total animation time
      ),
      
      // Stage 2: Move to third point (40% to 100% of animation)
      TweenSequenceItem(
        tween: CustomRocketTween(
          begin: CustomRocketTweenModel(
            rocketSize: 2,
            rocketTurns: 0.5,
            bottom: 300,
            left: 150,
          ),
          end: CustomRocketTweenModel(
            rocketSize: 3,
            rocketTurns: 1.5, // Additional full rotation
            bottom: 50,
            left: 300,
          ),
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 60, // 60% of the total animation time
      ),
    ]).animate(rocketController);

    rocketController.repeat(reverse: true);
  }

  @override
  void dispose() {
    rocketController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: rocketAnimation,
      builder: (context, child) {
        return Positioned(
          left: rocketAnimation.value.left,
          bottom: rocketAnimation.value.bottom,
          child: Transform.rotate(
            angle: rocketAnimation.value.rocketTurns * 3.1416,
            child: Image.asset(
              'assets/rocket.jpg',
              width: 50 * rocketAnimation.value.rocketSize,
              height: 50 * rocketAnimation.value.rocketSize,
            ),
          ),
        );
      },
    );
  }
}

class CustomRocketTweenModel {
  final double rocketSize;
  final double rocketTurns;
  final double left;
  final double bottom;

  CustomRocketTweenModel({
    required this.rocketSize,
    required this.rocketTurns,
    required this.left,
    required this.bottom,
  });

  static CustomRocketTweenModel lerp(
      CustomRocketTweenModel begin, CustomRocketTweenModel end, double t) {
    return CustomRocketTweenModel(
      rocketSize: lerpDouble(begin.rocketSize, end.rocketSize, t)!,
      rocketTurns: lerpDouble(begin.rocketTurns, end.rocketTurns, t)!,
      left: lerpDouble(begin.left, end.left, t)!,
      bottom: lerpDouble(begin.bottom, end.bottom, t)!,
    );
  }
}

class CustomRocketTween extends Tween<CustomRocketTweenModel> {
  CustomRocketTween({super.begin, super.end});

  @override
  CustomRocketTweenModel lerp(double t) =>
      CustomRocketTweenModel.lerp(begin!, end!, t);
}