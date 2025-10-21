import 'dart:developer';

import 'package:flutter/material.dart';

class AnimationsView extends StatefulWidget {
  const AnimationsView({super.key});

  @override
  State<AnimationsView> createState() => _AnimationsViewState();
}

class _AnimationsViewState extends State<AnimationsView> {
  bool isValuesChanged = false;
  double left = 20;
  @override
  Widget build(BuildContext context) {
    /// Animated Widget
    /// is a widget where you can animate the the Widget based on changable property variable during time
    /// onEnd is a method which invoked after animation ends
    /// you can change the default Curve.linear to any curve, to help choose see the docs at https://api.flutter.dev/flutter/animation/Curves-class.html
    /// الفكر ة من الاخر عشان تعمل animation هي انك تغير القيم الي بتديها لل Animated Widget وتعمل setState عشان تحدث الui  و تعمل build
    /// فا الويدجت يعاد بنائها فا تلاقي تغير ف القيم الي كانت موجودة ف الويدجت القديمة فا تعمل الانيميشن
    /// غالبا ده بيحصل عن طريق didUpdateWidget method in statful widget
    /// سواء الكونتير هو الي حصل فوقيه مباشرة ال set state مع تغير القيم
    /// او ويدجت فوق منه هي الي غيرت القيم وادتهاله  وعملت set state  هتشتغل عادي

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //لو ناوي تحط container فوقيها يبقى لا استعمل animated container والعب ف الpadding بتاعه احسن
            AnimatedPadding(
              padding: EdgeInsets.only(left: left),
              onEnd: () {
                log('animation end');
              },
              duration: Duration(
                seconds: 1,
              ),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (isValuesChanged) {
                  //initial values
                  isValuesChanged = false;
                  left = 20;
                } else {
                  //new values
                  isValuesChanged = true;
                  left = 80;
                }
                setState(() {});
              },
              child: Text('Start Animation'),
            )
          ],
        ),
      ),
    );
  }
}
