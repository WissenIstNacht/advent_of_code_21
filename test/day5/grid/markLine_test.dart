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
    print(grid.toInts());
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
    print(grid.toInts());
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
}
