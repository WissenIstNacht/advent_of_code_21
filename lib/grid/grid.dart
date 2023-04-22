import 'cell.dart';

class Grid<T extends Cell> {
  /* LATE VARS ===================================================== */

  late int width, height;
  late List<List<T>> cells;

  /* CONSTRUCTOR ============================================================ */

  Grid();

  Grid.empty(int width, int height) {
    this.width = width;
    this.height = height;
    List.filled(height, List.filled(width, null));
  }

  Grid.filled(int width, int height, T val) {
    this.width = width;
    this.height = height;
    cells = List.generate(height, (_) => List.generate(width, (_) => val));
  }

  /* QUERY ================================================================== */

  T getCell(int x, int y) => cells[y][x];

  void setCell(int x, int y, T val) => cells[y][x] = val;

  bool outOfGrid(int x, int y) => x < 0 || x >= width || y < 0 || y >= height;

  List<T> getNeighbours(int x, int y) {
    if (outOfGrid(x, y)) throw ArgumentError("Arguments are out of bounds");

    final neighbours = <T>[];
    if (x - 1 >= 0) {
      final hc = getCell(x - 1, y);
      neighbours.add(hc);
    }
    if (y - 1 >= 0) {
      final hc = getCell(x, y - 1);
      neighbours.add(hc);
    }
    if (x + 1 < width) {
      final hc = getCell(x + 1, y);
      neighbours.add(hc);
    }
    if (y + 1 < height) {
      final hc = getCell(x, y + 1);
      neighbours.add(hc);
    }

    return neighbours;
  }

  // Given an int x,y position on the grid, return the surrounding elements as list
  List<T> getSurrounding(int x, int y) {
    if (outOfGrid(x, y)) throw ArgumentError("Arguments are out of bounds");
    var neighbourhood = <T>[];
    for (var i = x - 1; i <= x + 1; i++) {
      for (var j = y - 1; j <= y + 1; j++) {
        if (outOfGrid(i, j) || (i == x && j == y)) {
          continue;
        }
        neighbourhood.add(getCell(i, j));
      }
    }
    return neighbourhood;
  }

  /* UTILS ================================================================== */

  List<List<S>> map<S>(S Function(Cell) f) {
    return cells.map((List<T> r) => r.map(f).toList()).toList();
  }

  void forEach(void Function(Cell) f) {
    return cells.forEach((List<T> r) => r.forEach(f));
  }
}

class MarkableGrid<T extends MarkableCell> extends Grid<T> {
  void markCell(int x, int y) {
    final cell = getCell(x, y);
    cell.marked = true;
  }

  int countMarkedCells() {
    var count = 0;
    for (var j = 0; j < height; j++) {
      for (var i = 0; i < width; i++) {
        if (getCell(i, j).marked) count++;
      }
    }
    return count;
  }
}
