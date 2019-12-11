import 'dart:math';

import 'package:flutter/material.dart';

class GameModel with ChangeNotifier {
  int score = 0;
  int second = 31;
  List<List<int>> newBoard(int score) {
    var size = score < 7 ? score + 3 : 10,
        rng = Random(),
        chosenRow = rng.nextInt(size),
        chosenColumn = rng.nextInt(size);
    List<List<int>> board = [];
    for (var i = 0; i < size; i++) {
      List<int> row = [];
      for (var j = 0; j < size; j++) {
        row.add(i == chosenRow && j == chosenColumn ? 1 : 0);
      }
      board.add(row);
    }
    return board;
  }

  createBoard(
    double size,
    List<List<int>> blocks,
    int depth,
    MaterialColor color,
    double width,
  ) {
    return Container(
      height: width,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: blocks
            .map(
              (cols) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: cols
                    .map((item) => GestureDetector(
                          onTap: () {
                            if (item == 1) {
                              //next stage, score + 1
                              updateScore();
                              print(score);
                            } else {
                              //handle if wrong answer
                              print('ERRRROOOOR $score');
                            }
                          },
                          child: Container(
                            width: size,
                            height: size,
                            color: item > 0 ? color[depth] : color,
                          ),
                        ))
                    .toList(),
              ),
            )
            .toList(),
      ),
    );
  }

  updateScore() {
    score++;
    notifyListeners();
  }
}
