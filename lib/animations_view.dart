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
              CustomAnimatedList(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAnimatedList extends StatefulWidget {
  const CustomAnimatedList({
    super.key,
  });

  @override
  State<CustomAnimatedList> createState() => _CustomAnimatedListState();
}

class _CustomAnimatedListState extends State<CustomAnimatedList> {
  List<String> items = [
    'Eslam',
    'Ahmed',
    'Marwan',
    'Abass',
    'Salman',
  ];

  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: AnimatedList(
              initialItemCount: items.length,
              key: listKey,
              itemBuilder: (context, index, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: GestureDetector(
                    onTap: () {
                      _removeItem(index);
                    },
                    child: Text(
                      items[index],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
            onPressed: () {
              _addItem();
            },
            child: Text("Animate"),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  void _removeItem(int index) {
    listKey.currentState?.removeItem(
      index,
      (context, animation) => ScaleTransition(
        scale: animation,
        child: Container(
          width: 200,
          height: 100,
          color: Colors.red,
          child: Icon(
            Icons.delete,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
    items.removeAt(index);
  }

  void _addItem() {
    items.add('New Item ${items.length + 1}');
    listKey.currentState?.insertItem(items.length - 1);
  }
}
