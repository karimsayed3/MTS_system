import 'package:flutter/material.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';

class AnimationTestScreen extends StatefulWidget {
  const AnimationTestScreen({super.key});

  @override
  State<AnimationTestScreen> createState() => _AnimationTestScreenState();
}

class _AnimationTestScreenState extends State<AnimationTestScreen> {
  double dimension = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          verticalSpace(30),
          // AnimatedContainer(
          //   duration: const Duration(seconds: 1),
          //   curve: Curves.easeInCubic,
          //   height: dimension,
          //   width: dimension,
          //   color: ColorsManager.secondaryColor,
          // ),
          dimension == 100
              ? TweenAnimationBuilder(
                  tween: IntTween(begin: 0, end: 100),
                  duration: const Duration(seconds: 1),
                  builder: (context, value, child) {
                    return Text(value.toString(),style:TextStyle(
                      color: ColorsManager.secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ));
                  },
                )
              : const SizedBox.shrink(),
          SizedBox(
            width: 300,
            child: DefaultButton(
                onPressed: () {
                  setState(() {
                    dimension = dimension == 100 ? 200 : 100;
                  });
                },
                child: const Text("test")),
          ),
          verticalSpace(30),
        ],
      ),
    ));
  }
}
