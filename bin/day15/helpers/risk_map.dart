import 'package:advent_of_code_21/grid/cell.dart';
import 'package:advent_of_code_21/grid/grid.dart';
import 'package:advent_of_code_21/grid/positionable.dart';
import 'package:collection/collection.dart';

class VertexCell extends Cell<int> with Positionable {
  int distance = 10000000;
  VertexCell? previous;

  VertexCell(int content, int x, int y) : super(content) {
    this.x = x;
    this.y = y;
  }
}

class RiskMap extends Grid<VertexCell> {
  RiskMap.parse(List<String> lines) {
    height = lines.length;
    width = lines.first.length;

    cells = [];
    lines.forEachIndexed((y, line) {
      final parsedLine = line
          .split("")
          .mapIndexed((x, char) => VertexCell(int.parse(char), x, y))
          .toList();
      cells.add(parsedLine);
    });
  }
}
