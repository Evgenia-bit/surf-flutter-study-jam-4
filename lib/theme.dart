import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/adaptability_manager.dart';


//цвета приложения
extension AppColors on ColorScheme {
  Color get magicBallTextColor => brightness == Brightness.light
      ? const Color.fromRGBO(108, 105, 140, 1)
      : Colors.white;

  Color get bottomTextColor => brightness == Brightness.light
      ? const Color.fromRGBO(108, 105, 140, 1)
      : const Color.fromRGBO(114, 114, 114, 1);

  Color get backgroundGradientBegin => brightness == Brightness.light
      ? Colors.white
      : const Color.fromRGBO(16, 12, 44, 1);

  Color get backgroundGradientEnd => brightness == Brightness.light
      ? const Color.fromRGBO(210, 210, 255, 1)
      : const Color.fromRGBO(0, 0, 2, 1);
}

//режим темы в текстовом формате (чтобы правильно определять пути до папок с картинками для разных тем)
extension ThemeMode on ThemeData {
 String get themeMode => brightness.toString().split('.')[1];
}

//данная функция позволяет создать светлую или темную тему
ThemeData theme({bool dark = false}) {
  final scheme = dark ? const ColorScheme.dark() : const ColorScheme.light();

  return ThemeData(
    colorScheme: scheme,
    primaryColor: scheme.primary,
    useMaterial3: true,
    textTheme: TextTheme(
      //стиль для текста внутри шара
      displayLarge: TextStyle(
        fontSize: AdaptabilityManager.magicBallFontSize,
        color: scheme.magicBallTextColor,
      ),
      //стиль для текста внизу экрана
      displaySmall: TextStyle(
        color: scheme.bottomTextColor,
        fontSize: AdaptabilityManager.bottomFontSize,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
