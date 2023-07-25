import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_practice_magic_ball/adaptability_manager.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_view_model.dart';
import 'package:surf_practice_magic_ball/screen/widgets/custom_animated_switched.dart';

class MagicBallText extends StatelessWidget {
  const MagicBallText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MagicBallViewModel>();
    final answer = model.answer;

    return SizedBox(
      width: AdaptabilityManager.magicBallSize * 0.7,
      child: CustomAnimatedSwitched(
        child: Text(
          answer,
          key: ValueKey<String>(answer),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
