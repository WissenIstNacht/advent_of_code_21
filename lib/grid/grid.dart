class Grid<T> {
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
    List.filled(height, List.filled(width, val));
  }

  /* QUERY ================================================================== */

  T getCell(int x, int y) => cells[y][x];

  bool outOfGrid(int x, int y) => x < 0 || x >= width || y < 0 || y >= height;

  /* UTILS ================================================================== */

  List<List<S>> map<S>(S Function(T) f) {
    return cells.map((List<T> r) => r.map(f).toList()).toList();
  }

  void forEach(Function(T) f) {
    return cells.forEach((List<T> r) => r.forEach(f));
  }
}
