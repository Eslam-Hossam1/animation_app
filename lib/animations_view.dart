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
              AnimatedCategories(),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedCategories extends StatefulWidget {
  const AnimatedCategories({
    super.key,
  });

  @override
  State<AnimatedCategories> createState() => _AnimatedCategoriesState();
}

class _AnimatedCategoriesState extends State<AnimatedCategories> {
  bool showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          AnimatedRotation(
            turns: showFirst ? 1 : 5,
            duration: Duration(milliseconds: 1000),
            child: Text('Eslam Hossam'),
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                showFirst = !showFirst;
              });
            },
            child: Text("Animate"),
          ),
        ],
      ),
    );
  }
}
