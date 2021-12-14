import 'package:advent_of_code_21/solver.dart';

import 'bingo.dart';
import 'board.dart';

class Day4Part2 extends Solver {
  Day4Part2() : super(4);

  @override
  String solve(List<String> input) {
    final game = Bingo.fromInput(input);
    final boardCount = game.boards.length;
    final winners = <Board>{};
    var currPick;

    while (winners.length < boardCount) {
      currPick = game.pickNumber();
      game.updateBoards(currPick);
      final roundWinners = game.hasWinningBoards();
      if (roundWinners.isNotEmpty) {
        for (var winner in roundWinners) {
          game.removeBoard(winner);
          winners.add(winner);
        }
      }
    }
    final lastBoard = winners.last;
    return (lastBoard.score() * currPick).toString();
  }
}
