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
          Container(
            color: const Color.fromRGBO(33, 150, 243, 1),
            width: 350,
            height: 200,
            child: Stack(
              children: [
                AnimatedPositioned(
                  top: 20,
                  left: showFirst ? 20 : 80,
                  duration: Duration(milliseconds: 300),
                  child: Text('Animated Positioned'),
                ),
                AnimatedPositionedDirectional(
                  top: 60,
                  start: showFirst ? 20 : 80,
                  duration: Duration(milliseconds: 300),
                  child: Text('Animated Positioned Directional'),
                ),
              ],
            ),
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
