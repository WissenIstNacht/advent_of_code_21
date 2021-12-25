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

  bool outOfGrid(int x, int y) => x < 0 || x >= height || y < 0 || y >= width;

  List<Cell> getNeighbours(int x, int y) {
    if (outOfGrid(x, y)) throw ArgumentError("Arguments are out of bounds");

    final neighbours = <Cell>[];
    if (x - 1 >= 0) {
      final hc = heights[x - 1][y];
      hc.x = x - 1;
      hc.y = y;
      neighbours.add(hc);
    }
    if (y - 1 >= 0) {
      final hc = heights[x][y - 1];
      hc.x = x;
      hc.y = y - 1;
      neighbours.add(hc);
    }
    if (x + 1 < height) {
      final hc = heights[x + 1][y];
      hc.x = x + 1;
      hc.y = y;
      neighbours.add(hc);
    }
    if (y + 1 < width) {
      final hc = heights[x][y + 1];
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
        final currCell = heights[i][j];
        final neighbours = getNeighbours(i, j);
        if (isLowPoint(currCell.content, neighbours)) lows.add(currCell);
      }
    }
    return lows;
  }

  List<Cell> findBasin(Cell lowPoint) {
    var curr = lowPoint;
    var next;
    var backtrackCounter = 0;

    Cell getNext() {
      if (curr.x < width - 1 && !heights[curr.y][curr.x + 1].marked) {
        return heights[curr.y][curr.x + 1];
      } else if (curr.y > 0 && !heights[curr.y - 1][curr.x].marked) {
        return heights[curr.y - 1][curr.x];
      } else if (curr.x > 0 && !heights[curr.y][curr.x - 1].marked) {
        return heights[curr.y][curr.x - 1];
      } else if (curr.y < height - 1 && !heights[curr.y + 1][curr.x].marked) {
        return heights[curr.y + 1][curr.x];
      }
      return curr;
    }

    final basin = <Cell>[];
    do {
      curr.marked = true;
      basin.add(curr);
      next = getNext();
      if (next == curr) {
        backtrackCounter++;
        next = basin[basin.length - backtrackCounter];
      }
      curr = next;
    } while (curr != lowPoint);

    return basin;
  }

  List<List<T>> map<T>(T Function(Cell) f) {
    return heights.map((List<Cell> r) => r.map(f).toList()).toList();
  }
}
