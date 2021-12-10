import 'cell.dart';

class Board {
  late Iterable<Iterable<Cell>> cells;

  Board.fromLines(Iterable<String> lines) {
    final cols = <Iterable<Cell>>[];
    for (var s in lines) {
      final numbers = s.split(" ");
      final row = numbers.map((s) => Cell.fromString(s));
      cols.add(row);
    }
    cells = cols;
  }

  Cell? contains(int n) {
    for (var row in cells) {
      if (row.any((c) => c.number == n)) {
        return row.firstWhere((c) => c.number == n);
      }
    }
  }
}
