import 'package:flutter/cupertino.dart';
import 'package:surf_practice_magic_ball/data/magic_ball_repository.dart';


//перечисление состояний шара
enum MagicBallState {
  start,
  loading,
  answerReceived,
  failed;

  //получение изображения поверхности шара на основе его текущего состояния
  String get mainImageFileName => switch (this) {
        MagicBallState.start => 'start.png',
        MagicBallState.loading ||
        MagicBallState.answerReceived =>
          'loading_answered.png',
        MagicBallState.failed => 'failed.png',
      };

  //получение изображения эллипса внизу шара на основе его текущего состояния
  String get bottomEllipseImageFileName => switch (this) {
        MagicBallState.failed => 'failed_bottom_ellipse.png',
        _ => 'bottom_ellipse.png'
      };

  //получение изображения тени внизу шара на основе его текущего состояния
  String get bottomShadowImageFileName => switch (this) {
        MagicBallState.failed => 'failed_bottom_shadow.png',
        _ => 'bottom_shadow.png'
      };
}


//вью модель главного экрана
class MagicBallViewModel extends ChangeNotifier {
  final _repository = MagicBallRepository();
  MagicBallState ballState = MagicBallState.start;
  String answer = '';

  Future<void> loadAnswer() async {
    if (ballState == MagicBallState.loading) return;

    ballState = MagicBallState.loading;
    answer = '';
    notifyListeners();

    try {
      answer = await _repository.getAnswer();
      ballState = MagicBallState.answerReceived;
    } catch (e) {
      answer = 'Произошла ошибка';
      ballState = MagicBallState.failed;
    } finally {
      //задержка нужна для анимирования загрузки ответа
      await Future.delayed(const Duration(seconds: 2));
      notifyListeners();
    }
  }
}
