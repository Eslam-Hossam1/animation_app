import 'package:animation_app/animations_view.dart';
import 'package:flutter/material.dart';

class AnimationApp extends StatelessWidget {
  const AnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimationsView(),
    );
  }
}