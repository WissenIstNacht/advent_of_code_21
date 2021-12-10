import 'board.dart';

class Bingo {
  late Iterable<int> numbers;
  late List<Board> boards;

  Bingo.fromInput(List<String> input) {
    final picks = input.first;
    numbers = picks.split(" ").map(int.parse);

    var i = 2;
    while (i < input.length) {
      final boardLines = input.getRange(i, i + 5);
      boards.add(Board.fromLines(boardLines));
      i += 6;
    }
  }

  void play() {
    return;
  }
}
