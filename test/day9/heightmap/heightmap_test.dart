import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../../bin/day9/helpers/cell.dart';
import '../../../bin/day9/helpers/heightmap.dart';

void main() {
  final sampleInput = readSampleInput(9);
  test('Properly constructs from sample input', () {
    final hm = HeightMap.parse(sampleInput);
    final ints = hm.map<int>((Cell e) => e.content);
    print(ints);
    expect(
        ints,
        equals([
          [2, 1, 9, 9, 9, 4, 3, 2, 1, 0],
          [3, 9, 8, 7, 8, 9, 4, 9, 2, 1],
          [9, 8, 5, 6, 7, 8, 9, 8, 9, 2],
          [8, 7, 6, 7, 8, 9, 6, 7, 8, 9],
          [9, 8, 9, 9, 9, 6, 5, 6, 7, 8]
        ]));
    expect(hm.height, equals(5));
    expect(hm.width, equals(10));
  });
  test('getNeighbours gets correct neighbours', () {
    final hm = HeightMap.parse(sampleInput);

    var neighbours = hm.getNeighbours(0, 0).map((e) => e.content);
    expect(neighbours, equals([1, 3]));

    neighbours = hm.getNeighbours(1, 0).map((e) => e.content);
    expect(neighbours, equals([2, 9, 9]));

    neighbours = hm.getNeighbours(2, 0).map((e) => e.content);
    expect(neighbours, equals([1, 9, 8]));

    neighbours = hm.getNeighbours(1, 1).map((e) => e.content);
    expect(neighbours, equals([3, 1, 8, 8]));

    neighbours = hm.getNeighbours(9, 0).map((e) => e.content);
    expect(neighbours, equals([1, 1]));
  });
  test('lowPoint identifies low points correctly', () {
    final hm = HeightMap.parse(sampleInput);
    final v1 = hm.getCell(0, 0).content;
    final v2 = hm.getCell(9, 0).content;

    var neighbours = hm.getNeighbours(0, 0);
    expect(hm.isLowPoint(v1, neighbours), isFalse);

    neighbours = hm.getNeighbours(9, 0);
    expect(hm.isLowPoint(v2, neighbours), isTrue);
  });
  test('get all low points', () {
    final hm = HeightMap.parse(sampleInput);
    final points = hm.findLowPoints().map((e) => e.content);
    expect(points, equals([1, 0, 5, 5]));
  });
  test('get basin for first low point in sample', () {
    final hm = HeightMap.parse(sampleInput);
    final lp = hm.findLowPoints();
    var p = lp.first;
    var b = hm.findBasin(p);
    expect(b.map((e) => e.content), equals([1, 2, 3]));
    p = lp[1];
    b = hm.findBasin(p);
    expect(b.map((e) => e.content), equals([0, 1, 2, 3, 4, 4, 2, 1, 2]));
    p = lp[2];
    b = hm.findBasin(p);
    expect(b.map((e) => e.content),
        equals([5, 6, 7, 8, 8, 7, 8, 8, 7, 6, 7, 8, 8, 8]));
    p = lp[3];
    b = hm.findBasin(p);
    expect(b.map((e) => e.content), equals([5, 6, 7, 8, 8, 7, 8, 6, 6]));
  });
}
