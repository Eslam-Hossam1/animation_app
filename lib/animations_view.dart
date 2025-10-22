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
            CustomAnimatedSearchBar(),
          ],
        ),
      ),
    );
  }
}

class CustomAnimatedSearchBar extends StatefulWidget {
  const CustomAnimatedSearchBar({
    super.key,
  });

  @override
  State<CustomAnimatedSearchBar> createState() =>
      _CustomAnimatedSearchBarState();
}

class _CustomAnimatedSearchBarState
    extends State<CustomAnimatedSearchBar> {
  bool isClicked = false;
  double width = 50;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Colors.cyan.withAlpha(30),
      width: width,
      duration: Duration(milliseconds: 500),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
          ),
        ),
        onTap: () {
          if (isClicked) {
            width = 50;
          } else {
            width = 300;
          }
          isClicked = !isClicked;
          setState(() {});
        },
      ),
    );
  }
}
