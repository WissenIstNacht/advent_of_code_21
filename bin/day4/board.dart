import 'cell.dart';

class Board {
  late Iterable<Iterable<Cell>> cells;

  Board.fromLines(Iterable<String> lines) {
    if (lines.length != 5) {
      throw ArgumentError("Board input does not have 5 rows");
    }
    final cols = <Iterable<Cell>>[];
    for (var s in lines) {
      final exp = RegExp("\\s+");
      final numbers = s.trim().split(exp);
      // final numbers = s.split(" ");
      if (numbers.length != 5) {
        throw ArgumentError(
            "Board input has a row that does not have 5 columns");
      }
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
