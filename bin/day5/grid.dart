import 'cell.dart';
import 'line.dart';

class Grid {
  late List<List<Cell>> cells;

  Grid.fromDimension(int width, int height) {
    cells = <List<Cell>>[];
    for (var i = 0; i < height; i++) {
      cells.add(List.generate(width, (i) => Cell(), growable: false));
    }
  }

  void markLine(Line line) {
    line.pointsCovered().forEach((p) => cells[p.y][p.x].lineCount++);
  }

  int countOverlaps() {
    var count = 0;
    for (var row in cells) {
      for (var cell in row) {
        if (cell.lineCount >= 2) count++;
      }
    }
    return count;
  }

  List<List<int>> toInts() {
    return cells.map((row) => row.map((c) => c.lineCount).toList()).toList();
  }
}
