import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'package:surf_practice_magic_ball/adaptability_manager.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_view_model.dart';
import 'package:surf_practice_magic_ball/screen/widgets/bottom_ellipse.dart';
import 'package:surf_practice_magic_ball/screen/widgets/bottom_shadow.dart';
import 'package:surf_practice_magic_ball/screen/widgets/magic_ball.dart';

class MagicBallWrapper extends StatefulWidget {
  const MagicBallWrapper({super.key});

  @override
  _MagicBallWrapperState createState() => _MagicBallWrapperState();
}

class _MagicBallWrapperState extends State<MagicBallWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _offsetController;
  late Animation<Offset> _offsetAnimation;
  final _tween = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, .05),
  );

  @override
  void initState() {
    ShakeDetector.autoStart(
      onPhoneShake: () => context.read<MagicBallViewModel>().loadAnswer(),
    );

    _offsetController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _offsetAnimation = _tween.animate(CurvedAnimation(
      parent: _offsetController,
      curve: Curves.easeInOut,
    ));

    super.initState();
  }

  @override
  void didChangeDependencies() {
    final model = context.watch<MagicBallViewModel>();
    if (model.ballState == MagicBallState.loading) {
      _offsetController.duration = const Duration(milliseconds: 100);
      _tween.end = const Offset(.01, 0);
    } else {
      _offsetController.duration = const Duration(milliseconds: 1000);
      _tween.end = const Offset(0, .05);
    }
    _offsetController.repeat(reverse: true);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _offsetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: AdaptabilityManager.magicBallSize,
            child: GestureDetector(
              onTap: context.read<MagicBallViewModel>().loadAnswer,
              child: SlideTransition(
                position: _offsetAnimation,
                child: const MagicBall(),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Stack(
            alignment: Alignment.center,
            children: [
              SlideTransition(
                position: _offsetAnimation,
                child: const BottomShadow(),
              ),
              const BottomEllipse(),
            ],
          ),
        ],
      ),
    );
  }
}
