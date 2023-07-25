import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/screen/widgets/magic_ball_surface.dart';
import 'package:surf_practice_magic_ball/screen/widgets/magic_ball_text.dart';

//виджет шара
class MagicBall extends StatelessWidget {
  const MagicBall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        MagicBallSurface(),
        MagicBallText(),
      ],
    );
  }
}
