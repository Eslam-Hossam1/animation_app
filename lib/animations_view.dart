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
    return Column(
      children: [
        AnimatedDefaultTextStyle(
          style: showFirst
              ? TextStyle(fontSize: 40, color: Colors.red)
              : TextStyle(fontSize: 20, color: Colors.blue),
          duration: Duration(milliseconds: 300),
          child: showFirst ? Text('Software Engineer') : Text('Eslam Hossam'),
        ),
        SizedBox(
          height: 20,
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
    );
  }
}
