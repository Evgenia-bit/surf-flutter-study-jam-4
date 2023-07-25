import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_practice_magic_ball/adaptability_manager.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_view_model.dart';
import 'package:surf_practice_magic_ball/screen/widgets/custom_animated_switched.dart';
import 'package:surf_practice_magic_ball/theme.dart';


//виджет элипса внизу шара
class BottomEllipse extends StatelessWidget {
  const BottomEllipse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MagicBallViewModel>();
    final bottomEllipseImageFileName =
        model.ballState.bottomEllipseImageFileName;
    final imageDir = 'images/${Theme.of(context).themeMode}/';

    return Positioned(
      bottom: 10,
      child: SizedBox(
        width: AdaptabilityManager.bottomEllipseWidth,
        child: CustomAnimatedSwitched(
          child: Image.asset(
            '$imageDir$bottomEllipseImageFileName',
            key: ValueKey<String>(bottomEllipseImageFileName),
          ),
        ),
      ),
    );
  }
}
