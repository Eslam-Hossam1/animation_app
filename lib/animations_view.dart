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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomAnimatedLoadingButton(),
          ],
        ),
      ),
    );
  }
}

class CustomAnimatedLoadingButton extends StatefulWidget {
  const CustomAnimatedLoadingButton({
    super.key,
  });

  @override
  State<CustomAnimatedLoadingButton> createState() =>
      _CustomAnimatedLoadingButtonState();
}

class _CustomAnimatedLoadingButtonState
    extends State<CustomAnimatedLoadingButton> {
  bool isLoading = false;
  double width = 300;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: width,
      duration: Duration(milliseconds: 500),
      child: ElevatedButton(
        onPressed: () {
          if (isLoading) {
            width = 300;
          } else {
            width = 100;
          }
          isLoading = !isLoading;
          setState(() {});
        },
        child: AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: isLoading
              ? SizedBox.square(
                  dimension: 25, child: CircularProgressIndicator())
              : Text('Loading Button'),
        ),
      ),
    );
  }
}
