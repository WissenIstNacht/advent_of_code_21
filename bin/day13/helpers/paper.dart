import 'package:advent_of_code_21/grid/grid.dart';

import '../../day5/helpers/point.dart';
import 'dots.dart';
import 'instruction.dart';

// Note: this approach uses a Grid with marks to simulate the dots on the
// foldable paper. This is extremely wasteful.
class Paper extends MarkableGrid<Dot> {
  /* CONSTRUCTOR ============================================================ */

  Paper.fromCoordinates(List<String> coordinates) {
    width = 0;
    height = 0;

    //find dimension
    final dots = coordinates.map((s) => Point.fromString(s)).toList();
    for (var dot in dots) {
      if (dot.x > width) width = dot.x;
      if (dot.y > height) height = dot.y;
    }
    height++;
    width++;
    cells =
        List.generate((height), (i) => List.generate((width), (j) => Dot()));

    //mark dots according to coordinates
    for (var dot in dots) {
      getCell(dot.x, dot.y).marked = true;
    }
  }

  /* ACTIONS ================================================================ */

  void fold(FoldInstruction i) {
    if (i.axis == Axis.horizontal) {
      _foldHorizontal(i.location);
    } else {
      _foldVertical(i.location);
    }
  }

  void _foldHorizontal(int location) {
    // when 0-indexing, this is actually location+1
    for (var j = location; j < height; j++) {
      for (var i = 0; i < width; i++) {
        if (getCell(i, j).marked == true) {
          var y = 2 * location - j;
          getCell(i, y).marked = true;
        }
      }
    }
    height = location;
  }

  void _foldVertical(int location) {
    for (var j = 0; j < height; j++) {
      for (var i = location; i < width; i++) {
        if (getCell(i, j).marked == true) {
          var x = 2 * location - i;
          getCell(x, j).marked = true;
        }
      }
    }
    width = location;
  }
}
