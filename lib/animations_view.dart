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
  bool isLeft = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 200,
      decoration: BoxDecoration(
        color: Color(0xff29282D),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            top: 5,
            left: isLeft ? 5 : 95,
            right: isLeft ? 95 : 5,
            duration: Duration(milliseconds: 250),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xff5D5D63),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior
                      .opaque, // 👈 makes the whole area tappable

                  onTap: () {
                    setState(() {
                      isLeft = true;
                    });
                  },
                  child: Center(
                    child: Text(
                      'All',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior
                      .opaque, // 👈 makes the whole area tappable

                  onTap: () {
                    setState(() {
                      isLeft = false;
                    });
                  },
                  child: Center(
                    child: Text(
                      'Contacts',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
