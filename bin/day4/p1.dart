import 'package:advent_of_code_21/solver.dart';

import 'bingo.dart';

// Rules of Bingo:
//  Player has at least one 5x5 borad with numbers.
//  Numbers are picked at random.
//  If a picked number appears on any card it is marked.
//  If a row or column on a card is completely marked, that board wins.

// Input:
//  A line of (comma separated) random numbers. (followed by an empty line)
//  5 lines with 5 (space separated) numbers. (followed by an empty line)
//  (repeats)

// Goal:
//  Simulate a game of Bingo, until one board wins.
//  Compute that board's score as follows:
//    Find the sum of all unmarked numbers.
//    Get the last number called.
//    Multiply those numbers.

class Day4Part1 extends Solver {
  Day4Part1() : super(4);

  @override
  String solve(List<String> input) {
    final game = Bingo.fromInput(input);

    while (true) {
      final currPick = game.pickNumber();
      game.updateBoards(currPick);
      final winner = game.hasWinningBoards();
      if (winner.isNotEmpty) {
        return (winner.first.score() * currPick).toString();
      }
    }
  }
}
