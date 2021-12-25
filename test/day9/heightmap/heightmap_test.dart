import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../../bin/day9/helpers/cell.dart';
import '../../../bin/day9/helpers/heightmap.dart';

void main() {
  final sampleInput = readSampleInput(9);
  test('Properly constructs from sample input', () {
    final hm = HeightMap.parse(sampleInput);
    final ints = hm.map<int>((Cell e) => e.content);
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
    expect(neighbours, equals([3, 1]));

    neighbours = hm.getNeighbours(1, 0).map((e) => e.content);
    expect(neighbours, equals([2, 9, 9]));

    neighbours = hm.getNeighbours(0, 2).map((e) => e.content);
    expect(neighbours, equals([1, 8, 9]));

    neighbours = hm.getNeighbours(1, 1).map((e) => e.content);
    expect(neighbours, equals([1, 3, 8, 8]));

    neighbours = hm.getNeighbours(0, 9).map((e) => e.content);
    expect(neighbours, equals([1, 1]));
  });
  test('lowPoint identifies low points correctly', () {
    final hm = HeightMap.parse(sampleInput);
    final v1 = hm.heights[0][0].content;
    final v2 = hm.heights[0][9].content;

    var neighbours = hm.getNeighbours(0, 0);
    expect(hm.isLowPoint(v1, neighbours), isFalse);

    neighbours = hm.getNeighbours(0, 9);
    expect(hm.isLowPoint(v2, neighbours), isTrue);
  });
  test('get all low points', () {
    final hm = HeightMap.parse(sampleInput);
    final points = hm.findLowPoints().map((e) => e.content);
    expect(points, equals([1, 0, 5, 5]));
  });
  });
}
