import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_practice_magic_ball/adaptability_manager.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_view_model.dart';
import 'package:surf_practice_magic_ball/screen/widgets/custom_animated_switched.dart';
import 'package:surf_practice_magic_ball/theme.dart';

class BottomShadow extends StatelessWidget {
  const BottomShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MagicBallViewModel>();
    final bottomShadowImageFileName = model.ballState.bottomShadowImageFileName;
    final imageDir = 'images/${Theme.of(context).themeMode}/';

    return CustomAnimatedSwitched(
      child: Image.asset(
        '$imageDir$bottomShadowImageFileName',
        key: ValueKey<String>(bottomShadowImageFileName),
        width: AdaptabilityManager.bottomShadowWidth,
      ),
    );
  }
}
