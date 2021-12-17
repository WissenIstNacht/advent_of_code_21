import 'package:advent_of_code_21/solver.dart';

import 'grid.dart';
import 'line.dart';

class Day5Part1 extends Solver {
  Day5Part1() : super(5);

  @override
  String solve(List<String> input) {
    var largestX = 0, largestY = 0;
    final axialLines = input
        .map((s) => AxialLine.fromString(s))
        .where((line) => line.isHorizontal || line.isVertical);
    axialLines.forEach((l) {
      if (l.start.x > largestX) largestX = l.start.x;
      if (l.end.x > largestX) largestX = l.end.x;
      if (l.start.y > largestY) largestY = l.start.y;
      if (l.start.y > largestY) largestY = l.start.y;
    });
    final grid = Grid.fromDimension(largestX + 1, largestY + 1);
    axialLines.forEach((line) => grid.markAxialLine(line));

    return grid.countOverlaps().toString();
  }
}
