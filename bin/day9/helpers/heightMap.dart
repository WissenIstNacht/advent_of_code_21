import 'package:advent_of_code_21/grid/grid.dart';
import 'package:collection/collection.dart';
import 'height.dart';

class HeightMap extends MarkableGrid<Height> {
  /* CONSTRUCTOR ============================================================ */

  HeightMap.parse(List<String> lines) {
    height = lines.length;
    width = lines.first.length;

    cells = [];
    lines.forEachIndexed((y, line) {
      final parsedLine = line
          .split("")
          .mapIndexed((x, s) => Height.parseWithPosition(s, x, y))
          .toList();
      cells.add(parsedLine);
    });
  }

  /* QUERIES ================================================================ */

  bool isLowPoint(int val, List<Height> neighbours) =>
      neighbours.every((e) => e.content > val);

  List<Height> findLowPoints() {
    final lows = <Height>[];
    for (var i = 0; i < height; i++) {
      for (var j = 0; j < width; j++) {
        final currCell = getCell(j, i);
        final neighbours = getNeighbours(j, i);
        if (isLowPoint(currCell.content, neighbours)) lows.add(currCell);
      }
    }
    return lows;
  }

  List<Height> findBasin(Height lowPoint) {
    var curr = lowPoint;
    final backtracker = <Height>[];
    final basin = <Height>[];

    Height getNext() {
      if (curr.x < width - 1 && !getCell(curr.x + 1, curr.y).marked) {
        return getCell(curr.x + 1, curr.y);
      }
      if (curr.y > 0 && !getCell(curr.x, curr.y - 1).marked) {
        return getCell(curr.x, curr.y - 1);
      }
      if (curr.x > 0 && !getCell(curr.x - 1, curr.y).marked) {
        return getCell(curr.x - 1, curr.y);
      }
      if (curr.y < height - 1 && !getCell(curr.x, curr.y + 1).marked) {
        return getCell(curr.x, curr.y + 1);
      }
      return curr;
    }

    do {
      if (!curr.marked) {
        curr.marked = true;
        basin.add(curr);
      }
      final next = getNext();

      if (curr == next) {
        if (backtracker.isEmpty) {
          break;
        } else {
          curr = backtracker.removeLast();
        }
      } else {
        backtracker.add(curr);
        curr = next;
      }
    } while (true);

    return basin;
  }
}
