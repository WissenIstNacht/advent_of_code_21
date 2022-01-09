import 'package:advent_of_code_21/grid/grid.dart';

import 'octopus.dart';

class Cavern extends MarkableGrid<Octopus> {
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

  /* ACTIONS ================================================================ */

  void step() {
    for (var j = 0; j < height; j++) {
      for (var i = 0; i < width; i++) {
        final octopus = getCell(i, j);
        octopus.fill();
      }
    }

    var currentFlashCount;
    do {
      currentFlashCount = flashCount;
      for (var j = 0; j < height; j++) {
        for (var i = 0; i < width; i++) {
          final octopus = getCell(i, j);
          if (octopus.isFull() && !octopus.marked) {
            octopus.flash();
            flashCount++;
            final neighbours = getSurrounding(i, j);
            neighbours.forEach((n) {
              n.fill();
            });
          }
        }
      }
    } while (flashCount != currentFlashCount);

    for (var j = 0; j < height; j++) {
      for (var i = 0; i < width; i++) {
        final octopus = getCell(i, j);
        if (octopus.isFull()) {
          octopus.reset();
        }
      }
    }
  }
}
