import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../../bin/day9/helpers/heightmap.dart';

void main() {
  final sampleInput = readSampleInput(9);
  test('Properly constructs from sample input', () {
    final hm = HeightMap.parse(sampleInput);
    expect(
        hm.heights,
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
    expect(hm.getNeighbours(0, 0), equals([3, 1]));
    expect(hm.getNeighbours(1, 0), equals([2, 9, 9]));
    expect(hm.getNeighbours(0, 2), equals([1, 8, 9]));
    expect(hm.getNeighbours(1, 1), equals([1, 3, 8, 8]));
    expect(hm.getNeighbours(0, 9), equals([1, 1]));
  });
  test('lowPoint identifies low points correctly', () {
    final hm = HeightMap.parse(sampleInput);
    final v1 = hm.heights[0][0];
    final v2 = hm.heights[0][9];
    expect(hm.isLowPoint(v1, [3, 1]), isFalse);
    expect(hm.isLowPoint(v2, [1, 1]), isTrue);
  });
  test('get all low points', () {
    final hm = HeightMap.parse(sampleInput);
    expect(hm.findLowPoints(), equals([1, 0, 5, 5]));
  });
}
