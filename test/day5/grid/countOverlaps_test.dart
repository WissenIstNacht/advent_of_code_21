import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../../bin/day5/grid.dart';
import '../../../bin/day5/line.dart';

void main() {
  test('No overlaps', () {
    final grid = Grid.fromDimension(3, 3);
    final l = Line.fromString("0,0 -> 2,0");
    grid.markLine(l);

    expect(grid.countOverlaps(), equals(0));
  });
  test('One overlap', () {
    final grid = Grid.fromDimension(3, 3);
    final l = Line.fromString("0,0 -> 0,2");
    final m = Line.fromString("0,0 -> 2,0");
    grid.markLine(l);
    grid.markLine(m);

    expect(grid.countOverlaps(), equals(1));
  });
  test('three overlaps', () {
    final grid = Grid.fromDimension(3, 3);
    final l = Line.fromString("0,0 -> 0,2");
    final m = Line.fromString("0,0 -> 2,0");
    grid.markLine(l);
    grid.markLine(l);

    expect(grid.countOverlaps(), equals(3));
  });
  test('Marking on sample input', () {
    final grid = Grid.fromDimension(10, 10);
    final input = readSampleInput(5);
    final lines = input
        .map((s) => Line.fromString(s))
        .where((line) => line.isAxial())
        .forEach((line) => grid.markLine(line));
    expect(grid.countOverlaps(), equals(5));
  });
}
