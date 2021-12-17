import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../../bin/day5/grid.dart';
import '../../../bin/day5/line.dart';

void main() {
  test('No overlaps', () {
    final grid = Grid.fromDimension(3, 3);
    final l = AxialLine.fromString("0,0 -> 2,0");
    grid.markAxialLine(l);

    expect(grid.countOverlaps(), equals(0));
  });
  test('One overlap', () {
    final grid = Grid.fromDimension(3, 3);
    final l = AxialLine.fromString("0,0 -> 0,2");
    final m = AxialLine.fromString("0,0 -> 2,0");
    grid.markAxialLine(l);
    grid.markAxialLine(m);

    expect(grid.countOverlaps(), equals(1));
  });
  test('three overlaps', () {
    final grid = Grid.fromDimension(3, 3);
    final l = AxialLine.fromString("0,0 -> 0,2");
    final m = AxialLine.fromString("0,0 -> 2,0");
    grid.markAxialLine(l);
    grid.markAxialLine(l);

    expect(grid.countOverlaps(), equals(3));
  });
  test('Marking on sample input', () {
    final grid = Grid.fromDimension(10, 10);
    final input = readSampleInput(5);
    final lines = input
        .map((s) => AxialLine.fromString(s))
        .where((line) => line.isHorizontal || line.isVertical)
        .forEach((line) => grid.markAxialLine(line));
    expect(grid.countOverlaps(), equals(5));
  });
}
