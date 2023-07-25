import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'package:surf_practice_magic_ball/adaptability_manager.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_view_model.dart';
import 'package:surf_practice_magic_ball/screen/widgets/bottom_ellipse.dart';
import 'package:surf_practice_magic_ball/screen/widgets/bottom_shadow.dart';
import 'package:surf_practice_magic_ball/screen/widgets/magic_ball.dart';

//анимированная обертка шара
class MagicBallWrapper extends StatefulWidget {
  const MagicBallWrapper({super.key});

  @override
  _MagicBallWrapperState createState() => _MagicBallWrapperState();
}

class _MagicBallWrapperState extends State<MagicBallWrapper>
    with SingleTickerProviderStateMixin {
  late final AnimationController _offsetController;
  late final Animation<Offset> _offsetAnimation;
  late final Tween<Offset> _tween;
  final _defaultAnimationDuration = const Duration(milliseconds: 1000);
  final _shakingAnimationDuration = const Duration(milliseconds: 100);
  final _defaultTweenEnd = const Offset(0, .05);
  final _shakingTweenEnd = const Offset(.01, 0);

  @override
  void initState() {
    ShakeDetector.autoStart(
      onPhoneShake: () => context.read<MagicBallViewModel>().loadAnswer(),
    );
    _tween = Tween<Offset>(
      begin: Offset.zero,
      end: _defaultTweenEnd,
    );
    _offsetController = AnimationController(
      vsync: this,
      duration: _defaultAnimationDuration,
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
      //если идет загрузка, то включается анимация тряски шара
      _offsetController.duration = _shakingAnimationDuration;
      _tween.end = _shakingTweenEnd;
    } else {
      //если загрузки нет, то включается дефолтная анимация (когда шар парит вверх-вниз)
      _offsetController.duration = _defaultAnimationDuration;
      _tween.end = _defaultTweenEnd;
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
          if(AdaptabilityManager.deviceType == DeviceType.mobile) const SizedBox(height: 50),
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
