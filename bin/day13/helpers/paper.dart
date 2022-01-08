import 'package:advent_of_code_21/grid/grid.dart';

import '../../day5/helpers/point.dart';
import 'dots.dart';
import 'instruction.dart';

// Note: this approach uses a Grid with marks to simulate the dots on the
// foldable paper. This is extremely wasteful.
class Paper extends Grid<Dot> {
  late List<Point> dots;

  Paper.fromCoordinates(List<String> coordinates) {
    width = 0;
    height = 0;

    //find dimension
    dots = coordinates.map((s) => Point.fromString(s)).toList();
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

  void fold(FoldInstruction i) {
    if (i.axis == Axis.horizontal) {
      foldHorizontal(i.location);
    } else {
      foldVertical(i.location);
    }
  }

  void foldHorizontal(int location) {
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

  void foldVertical(int location) {
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

  int countMarked() {
    var count = 0;
    for (var j = 0; j < height; j++) {
      for (var i = 0; i < width; i++) {
        if (getCell(i, j).marked) count++;
      }
    }
    return count;
  }
}
