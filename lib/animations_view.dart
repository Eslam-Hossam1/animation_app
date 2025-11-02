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
        Container(
          color: Colors.red,
          height: 100,
          width: 100,
          child: AnimatedCrossFade(
            firstChild: Icon(
              Icons.favorite,
              color: Colors.white,
              size: 50,
            ),
            secondChild: FlutterLogo(
              size: 50,
            ),
            crossFadeState: showFirst
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: Duration(
              milliseconds: 500,
            ),
          ),
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
