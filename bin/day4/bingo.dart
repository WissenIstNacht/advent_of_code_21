import 'board.dart';

class Bingo {
  late Iterable<int> numbers;
  late List<Board> boards;

  Bingo.fromInput(List<String> input) {
    final picks = input.first;
    numbers = picks.split(",").map(int.parse);
    if (numbers.isEmpty) {
      throw ArgumentError("The game has no numbers picked");
    }

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
  void play() {
    return;
  }
}
