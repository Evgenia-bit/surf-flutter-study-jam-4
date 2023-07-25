import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/adaptability_manager.dart';
import 'package:surf_practice_magic_ball/screen/widgets/bottom_text.dart';
import 'package:surf_practice_magic_ball/screen/widgets/magic_ball.dart';
import 'package:surf_practice_magic_ball/screen/widgets/magic_ball_wrapper.dart';
import 'package:surf_practice_magic_ball/theme.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.backgroundGradientBegin,
              theme.colorScheme.backgroundGradientEnd,
            ],
          ),
        ),
        child: const Center(
          child: Column(
            children: [
              MagicBallWrapper(),
              BottomText(),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}