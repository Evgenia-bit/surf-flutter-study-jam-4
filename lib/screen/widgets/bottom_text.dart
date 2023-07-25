import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/adaptability_manager.dart';

class BottomText extends StatelessWidget {
  const BottomText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AdaptabilityManager.magicBallSize / 1.5,
      child: Text(
        AdaptabilityManager.bottomText,
        style: Theme.of(context).textTheme.displaySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
