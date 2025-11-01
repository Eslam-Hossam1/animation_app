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
              DynamicPopups(),
            ],
          ),
        ),
      ),
    );
  }
}

class DynamicPopups extends StatefulWidget {
  const DynamicPopups({
    super.key,
  });

  @override
  State<DynamicPopups> createState() => _DynamicPopupsState();
}

class _DynamicPopupsState extends State<DynamicPopups> {
  bool isClicked = false;
  double scale = 1.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              fit: BoxFit.cover,
              'assets/gumball-and-darwin-vuxp4qvtbz62xoxn.jpg',
              height: 200,
              width: 100,
            ),
            AnimatedPositioned(
              top: isClicked ? 200 : 0,
              duration: Duration(
                milliseconds: 800,
              ),
              child: Container(
                height: 200,
                width: 100,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              if (isClicked) {
                setState(() {
                  isClicked = false;
                });
              } else {
                setState(() {
                  isClicked = true;
                });
              }
            },
            child: Text('Click Me')),
      ],
    );
  }
}
