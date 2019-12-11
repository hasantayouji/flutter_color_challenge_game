import 'models/game_model.dart';
import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameModel>(
      create: (context) => GameModel(),
      child: MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}
