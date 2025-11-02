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

enum SelectedWidget { first, second, third }

class _AnimatedCategoriesState extends State<AnimatedCategories> {
  SelectedWidget selectedWidget = SelectedWidget.first;
                int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: switch (selectedWidget) {
            SelectedWidget.first => FlutterLogo(size: 50),
            SelectedWidget.second => Text('Second'),
            SelectedWidget.third => Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
          },
        ),
        SizedBox(
          height: 100,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedWidget = SelectedWidget
                  .values[counter++ % SelectedWidget.values.length];
            });
          },
          child: Text("Animate"),
        ),
      ],
    );
  }
}
