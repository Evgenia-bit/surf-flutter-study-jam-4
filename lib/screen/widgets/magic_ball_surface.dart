import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_view_model.dart';
import 'package:surf_practice_magic_ball/screen/widgets/custom_animated_switched.dart';
import 'package:surf_practice_magic_ball/theme.dart';


//виджет поверхности шара
class MagicBallSurface extends StatelessWidget {
  const MagicBallSurface({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MagicBallViewModel>();
    final mainImageFileName = model.ballState.mainImageFileName;
    final imageDir = 'images/${Theme.of(context).themeMode}/';

    return CustomAnimatedSwitched(
      child: Image.asset(
        '$imageDir$mainImageFileName',
        key: ValueKey<String>(mainImageFileName),
        fit: BoxFit.cover,
      ),
    );
  }
}
