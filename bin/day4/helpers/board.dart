import 'package:advent_of_code_21/grid/grid.dart';
import 'package:collection/collection.dart';

import 'number.dart';

class Board extends MarkableGrid<Number> {
  /* CONSTRUCTORS =========================================================== */

  Board.fromLines(List<String> lines) {
    if (lines.length != 5) {
      throw ArgumentError("Board input does not have 5 rows");
    }
    cells = [];
    for (var s in lines) {
      final exp = RegExp("\\s+");
      final numbers = s.trim().split(exp);
      // final numbers = s.split(" ");
      if (numbers.length != 5) {
        throw ArgumentError(
            "Board input has a row that does not have 5 columns");
      }
      final row = numbers.map((s) => Number.parse(s)).toList();
      cells.add(row);
    }
  }

  /* QUERIES ================================================================ */

  // TODO extract this to grid
  Number? contains(int n) {
    for (var row in cells) {
      final c = row.firstWhereOrNull((c) => c.content == n);
      if (c != null) return c;
    }
  }

  bool hasWon() {
    var fullColumns = List.filled(cells.first.length, true);
    for (var row in cells) {
      var fullLine = true;
      row.forEachIndexed((i, c) {
        fullLine = fullLine && c.marked;
        fullColumns[i] = fullColumns[i] && c.marked;
      });
      if (fullLine) return true;
    }
    return fullColumns.any((c) => c);
  }

  int getScore() {
    var score = 0;
    for (var row in cells) {
      for (var cell in row) {
        if (!cell.marked) score += cell.content;
      }
    }
    return score;
  }
}
