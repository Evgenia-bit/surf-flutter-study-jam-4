import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_screen.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_view_model.dart';
import 'package:surf_practice_magic_ball/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      darkTheme: theme(dark: true),
      home: ChangeNotifierProvider(
        create: (_) => MagicBallViewModel(),
        child: const MagicBallScreen(),
      ),
    );
  }
}
