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

  void markAxialLine(AxialLine line) {
    if (line.isHorizontal) {
      for (var i = 0; i <= line.deltaX; i++) {
        final d = i * line.horizontalDirection;
        cells[line.start.y][line.start.x + d].lineCount += 1;
      }
    }
    if (line.isVertical) {
      for (var i = 0; i <= line.deltaY; i++) {
        final d = i * line.verticalDirection;
        cells[line.start.y + d][line.start.x].lineCount += 1;
      }
    }
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
