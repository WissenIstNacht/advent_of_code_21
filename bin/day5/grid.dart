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
      for (var i = line.start.x;
          i <= line.end.x;
          i += line.horizontalDirection) {
        cells[line.start.y][i].lineCount += 1;
      }
    }
    if (line.isVertical) {
      for (var i = line.start.y;
          i <= line.end.y;
          i += line.horizontalDirection) {
        cells[i][line.start.x].lineCount += 1;
      }
    }
  }

  List<List<int>> toInts() {
    return cells.map((row) => row.map((c) => c.lineCount).toList()).toList();
  }
}
