import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../../bin/day5/grid.dart';
import '../../../bin/day5/line.dart';

void main() {
  test('Marking a horizontal line', () {
    final grid = Grid.fromDimension(3, 3);
    final l = AxialLine.fromString("0,0 -> 2,0");
    grid.markAxialLine(l);
    final res = [
      [1, 1, 1],
      [0, 0, 0],
      [0, 0, 0]
    ];
    expect(grid.toInts(), equals(res));
  });
  test('Marking a vertical line', () {
    final grid = Grid.fromDimension(3, 3);
    final l = AxialLine.fromString("0,0 -> 0,2");
    grid.markAxialLine(l);
    final res = [
      [1, 0, 0],
      [1, 0, 0],
      [1, 0, 0]
    ];
    expect(grid.toInts(), equals(res));
  });
  test('Marking a vertical and horizontal line', () {
    final grid = Grid.fromDimension(3, 3);
    final l = AxialLine.fromString("0,0 -> 0,2");
    final m = AxialLine.fromString("0,0 -> 2,0");
    grid.markAxialLine(l);
    grid.markAxialLine(m);
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
    final lines = input
        .map((s) => AxialLine.fromString(s))
        .where((line) => line.isHorizontal || line.isVertical)
        .forEach((line) => grid.markAxialLine(line));
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
