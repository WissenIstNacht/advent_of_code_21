import 'package:collection/collection.dart';

import 'board.dart';

class Bingo {
  late Iterator<int> numbers;
  late List<Board> boards;

  Bingo.fromInput(List<String> input) {
    final picks = input.first;
    numbers = picks.split(",").map(int.parse).iterator;

    var i = 2;
    var newBoards = <Board>[];
    while (i < input.length) {
      final boardLines = input.getRange(i, i + 5);
      newBoards.add(Board.fromLines(boardLines));
      i += 6;
    }
    if (newBoards.isEmpty) {
      throw ArgumentError("The game has no boards");
    }
    boards = newBoards;
  }

  int pickNumber() {
    if (!numbers.moveNext()) {
      throw StateError("No more numbers to draw.");
    }
    return numbers.current;
  }

  void updateBoards(int numberPicked) {
    for (var board in boards) {
      final c = board.contains(numberPicked);
      c?.marked = true;
    }
  }

  Board? hasWinningBoard() {
    return boards.firstWhereOrNull((b) => b.hasWon());
  }

  void removeBoard(Board board) {
    if (!boards.remove(board)) {
      throw StateError("Board was not found");
    }
  }
}
