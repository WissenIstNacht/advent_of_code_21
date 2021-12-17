import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../../bin/day5/grid.dart';
import '../../../bin/day5/line.dart';

void main() {
  test('Marking a horizontal line', () {
    final grid = Grid.fromDimension(3, 3);
    final l = Line.fromString("0,0 -> 2,0");
    grid.markLine(l);
    final res = [
      [1, 1, 1],
      [0, 0, 0],
      [0, 0, 0]
    ];
    expect(grid.toInts(), equals(res));
  });
  test('Marking a vertical line', () {
    final grid = Grid.fromDimension(3, 3);
    final l = Line.fromString("0,0 -> 0,2");
    grid.markLine(l);
    final res = [
      [1, 0, 0],
      [1, 0, 0],
      [1, 0, 0]
    ];
    expect(grid.toInts(), equals(res));
  });
  test('Marking a vertical and horizontal line', () {
    final grid = Grid.fromDimension(3, 3);
    final l = Line.fromString("0,0 -> 0,2");
    final m = Line.fromString("0,0 -> 2,0");
    grid.markLine(l);
    grid.markLine(m);
    final res = [
      [2, 1, 1],
      [1, 0, 0],
      [1, 0, 0]
    ];
    expect(grid.toInts(), equals(res));
  });
  test('Marking on sample input', () {
    final grid = Grid.fromDimension(10, 10);
    final input = readSampleInput(5);
    input
        .map((s) => Line.fromString(s))
        .where((line) => line.isAxial())
        .forEach((line) => grid.markLine(line));

    final res = [
      [0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0, 0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0, 0, 0, 1, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
      [0, 1, 1, 2, 1, 1, 1, 2, 1, 1],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [2, 2, 2, 1, 1, 1, 0, 0, 0, 0],
    ];
    expect(grid.toInts(), equals(res));
  });
}
