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
              ButtonPressEffect(),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonPressEffect extends StatefulWidget {
  const ButtonPressEffect({
    super.key,
  });

  @override
  State<ButtonPressEffect> createState() => _ButtonPressEffectState();
}

class _ButtonPressEffectState extends State<ButtonPressEffect> {
  bool isClicked = false;
  double scale = 1.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTapUp: (_) {
      //   scale = 1;
      //   setState(() {});
      // },
      // onTapDown: (_) {
      //   scale = .8;
      //   setState(() {});
      // },
      onPanStart: (_) {
        scale = .8;
        setState(() {});
      },
      onPanEnd: (_) {
        scale = 1;
        setState(() {});
      },
      child: AnimatedScale(
        scale: scale,
        duration: Duration(milliseconds: 300),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Press Me",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
