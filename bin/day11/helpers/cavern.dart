import 'package:advent_of_code_21/grid/grid.dart';

import 'octopus.dart';

class Cavern extends Grid<Octopus> {
  int flashCount = 0;

  /* CONSTRUCTOR ============================================================ */

  Cavern.parse(List<String> lines) {
    height = lines.length;
    width = lines.first.length;

    cells = [];
    for (var line in lines) {
      final parsedLine = line.split("").map((s) => Octopus.parse(s)).toList();
      cells.add(parsedLine);
    }
  }

  /* QUERIES ================================================================ */

  void step() {
    for (var j = 0; j < height; j++) {
      for (var i = 0; i < width; i++) {
        final octopus = getCell(i, j);
        octopus.fill();
        if (octopus.isFull()) {
          flashCount++;
          octopus.flash();
          final neighbours = getNeighbours(i, j);
          neighbours.forEach((o) => o.fill());
        }
      }
    }
  }
}
