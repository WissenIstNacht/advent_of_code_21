import 'cell.dart';

class HeightMap {
  late int width, height;
  late List<List<Cell>> heights;

  HeightMap.parse(List<String> lines) {
    height = lines.length;
    width = lines.first.length;

    heights = [];
    for (var line in lines) {
      final parsedLine = line.split("").map((s) => Cell.parse(s)).toList();
      heights.add(parsedLine);
    }
  }

  Cell getCell(int x, int y) => heights[y][x];

  bool outOfGrid(int x, int y) => x < 0 || x >= width || y < 0 || y >= height;

  List<Cell> getNeighbours(int x, int y) {
    if (outOfGrid(x, y)) throw ArgumentError("Arguments are out of bounds");

    final neighbours = <Cell>[];
    if (x - 1 >= 0) {
      final hc = getCell(x - 1, y);
      hc.x = x - 1;
      hc.y = y;
      neighbours.add(hc);
    }
    if (y - 1 >= 0) {
      final hc = getCell(x, y - 1);
      hc.x = x;
      hc.y = y - 1;
      neighbours.add(hc);
    }
    if (x + 1 < width) {
      final hc = getCell(x + 1, y);
      hc.x = x + 1;
      hc.y = y;
      neighbours.add(hc);
    }
    if (y + 1 < height) {
      final hc = getCell(x, y + 1);
      hc.x = x;
      hc.y = y + 1;
      neighbours.add(hc);
    }

    return neighbours;
  }

  bool isLowPoint(int val, List<Cell> neighbours) =>
      neighbours.every((e) => e.content > val);

  List<Cell> findLowPoints() {
    final lows = <Cell>[];
    for (var i = 0; i < height; i++) {
      for (var j = 0; j < width; j++) {
        final currCell = getCell(j, i);
        final neighbours = getNeighbours(j, i);
        if (isLowPoint(currCell.content, neighbours)) lows.add(currCell);
      }
    }
    return lows;
  }

  List<Cell> findBasin(Cell lowPoint) {
    var curr = lowPoint;
    final backtracker = <Cell>[];
    final basin = <Cell>[];

    Cell getNext() {
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

  List<List<T>> map<T>(T Function(Cell) f) {
    return heights.map((List<Cell> r) => r.map(f).toList()).toList();
  }
}
