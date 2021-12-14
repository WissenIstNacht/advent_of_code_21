import 'package:advent_of_code_21/solver.dart';

import 'bingo.dart';

class Day4Part2 extends Solver {
  Day4Part2() : super(4);

  @override
  String solve(List<String> input) {
    final game = Bingo.fromInput(input);
    var gamesWon = 0;
    var lastBoard;
    var currPick;

    while (gamesWon < game.boards.length) {
      final currPick = game.pickNumber();
      game.updateBoards(currPick);
      final winner = game.hasWinningBoard();
      if (winner != null) {
        gamesWon++;
        lastBoard = winner;
      }
    }
    return (lastBoard.score() * currPick).toString();
  }
}
