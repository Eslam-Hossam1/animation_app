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
  bool isClicked = false;
  int currentIndex = 0;
  double scale = 1.0;
  static List<String> categories = [
    "Category 1",
    "Category 2",
    "Category 3",
    "Category 4",
    "Category 5",
    "Category 6",
    "Category 7",
    "Category 8",
    "Category 9",
    "Category 10",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          isClicked = currentIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: AnimatedContainer(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isClicked ? Colors.orange : Colors.grey,
                ),
                color: isClicked ? Colors.orange : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              duration: Duration(
                milliseconds: 300,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${categories[index]}',
                  style: TextStyle(
                    color: isClicked ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 10,
          );
        },
        itemCount: 20,
      ),
    );
  }
}
