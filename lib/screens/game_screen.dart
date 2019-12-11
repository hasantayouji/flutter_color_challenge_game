import 'package:flutter_color_challenge_game/models/game_model.dart';
import 'package:flutter_color_challenge_game/models/timer_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class GameScreen extends StatelessWidget {
  GameScreen({this.second});
  final second;
  final palette = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.brown,
    Colors.purpleAccent
  ];
  final warna = Random().nextInt(7);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Consumer<GameModel>(
      builder: (context, scoreUpdate, child) => Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Timer(
                  value: second,
                  onEnd: () {},
                  width: w,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(2),
                child: scoreUpdate.createBoard(
                    MediaQuery.of(context).size.width /
                        (scoreUpdate.score < 7 ? scoreUpdate.score + 4 : 11),
                    scoreUpdate.newBoard(scoreUpdate.score),
                    [1 + scoreUpdate.score ~/ 5, 4].reduce(min) * 100,
                    palette[warna],
                    w),
              ),
              Text(
                'Score: ${scoreUpdate.score}',
                style: TextStyle(fontSize: 24),
              )
            ],
          ),
        ),
      ),
    );
  }
}
