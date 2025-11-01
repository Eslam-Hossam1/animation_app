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
              CollapsibleFaqSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class CollapsibleFaqSection extends StatefulWidget {
  const CollapsibleFaqSection({
    super.key,
  });

  @override
  State<CollapsibleFaqSection> createState() => _CollapsibleFaqSectionState();
}

class _CollapsibleFaqSectionState extends State<CollapsibleFaqSection> {
  bool isClicked = false;
  double scale = 1.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('info'),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          height: isClicked ? 200 : 60,
          color: isClicked ? Colors.blue : Colors.red,
          child: Center(
            child: Text(
                'lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dolor sit amet consectetur adipiscing elit '),
          ),
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
