import 'package:collection/collection.dart';

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

  // QUERIES ===================================================================

  Cell? contains(int n) {
    for (var row in cells) {
      final c = row.firstWhereOrNull((c) => c.number == n);
      if (c != null) return c;
    }
  }

  bool hasWon() {
    var fullColumns = List.filled(cells.first.length, true);
    for (var row in cells) {
      var fullLine = true;
      row.forEachIndexed((i, c) {
        fullLine && c.marked;
        fullColumns[i] && c.marked;
      });
      if (fullLine) return true;
    }
    return fullColumns.any((c) => c);
  }

  int score() {
    var score = 0;
    for (var row in cells) {
      for (var cell in row) {
        if (!cell.marked) score += cell.number;
      }
    }
    return score;
  }
}
