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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ExpandableUserProfile(),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpandableUserProfile extends StatefulWidget {
  const ExpandableUserProfile({
    super.key,
  });

  @override
  State<ExpandableUserProfile> createState() =>
      _ExpandableUserProfileState();
}

class _ExpandableUserProfileState extends State<ExpandableUserProfile> {
  bool isClicked = false;
  double width = 150;
  double opacity = 0.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isClicked) {
          opacity = 0.0;
          width = 150;
        } else {
          opacity = 1.0;
          width = 350;
        }
        isClicked = !isClicked;
        setState(() {});
      },
      child: AnimatedContainer(
        width: width,
        duration: Duration(milliseconds: 500),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/gumball-and-darwin-vuxp4qvtbz62xoxn.jpg',
              ),
            ),
            AnimatedOpacity(
              opacity: opacity,
              duration: Duration(milliseconds: 500),
              child: Column(
                children: [
                  Text('Gumball and Darwin'),
                  Text('The Amazing World of Gumball'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
