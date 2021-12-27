import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../../bin/day10/helpers/line.dart';

void main() {
  final sampleInput = readSampleInput(10);
  test('Properly constructs from sample input', () {
    final l = Line.parse(sampleInput.first);
    expect(
        l.tokens.map((t) => t.value),
        equals([
          "[",
          "(",
          "{",
          "(",
          "<",
          "(",
          "(",
          ")",
          ")",
          "[",
          "]",
          ">",
          "[",
          "[",
          "{",
          "[",
          "]",
          "{",
          "<",
          "(",
          ")",
          "<",
          ">",
          ">"
        ]));
  });
  test('getNeighbours gets correct neighbours', () {
    var l = Line.parse(sampleInput[0]);
    l.analyze();
    expect(l.isCorrupted(), isFalse);
    l = Line.parse(sampleInput[2]);
    l.analyze();
    expect(l.isCorrupted(), isTrue);
    expect(l.illegalCharacter, equals("}"));
  });
  // test('lowPoint identifies low points correctly', () {
  //   final hm = HeightMap.parse(sampleInput);
  //   final v1 = hm.getCell(0, 0).content;
  //   final v2 = hm.getCell(9, 0).content;

  //   var neighbours = hm.getNeighbours(0, 0);
  //   expect(hm.isLowPoint(v1, neighbours), isFalse);

  //   neighbours = hm.getNeighbours(9, 0);
  //   expect(hm.isLowPoint(v2, neighbours), isTrue);
  // });
  // test('get all low points', () {
  //   final hm = HeightMap.parse(sampleInput);
  //   final points = hm.findLowPoints().map((e) => e.content);
  //   expect(points, equals([1, 0, 5, 5]));
  // });
  // test('get basin for first low point in sample', () {
  //   final hm = HeightMap.parse(sampleInput);
  //   final lp = hm.findLowPoints();
  //   var p = lp.first;
  //   var b = hm.findBasin(p);
  //   expect(b.map((e) => e.content), equals([1, 2, 3]));
  //   p = lp[1];
  //   b = hm.findBasin(p);
  //   expect(b.map((e) => e.content), equals([0, 1, 2, 3, 4, 4, 2, 1, 2]));
  //   p = lp[2];
  //   b = hm.findBasin(p);
  //   expect(b.map((e) => e.content),
  //       equals([5, 6, 7, 8, 8, 7, 8, 8, 7, 6, 7, 8, 8, 8]));
  //   p = lp[3];
  //   b = hm.findBasin(p);
  //   expect(b.map((e) => e.content), equals([5, 6, 7, 8, 8, 7, 8, 6, 6]));
  // });
}
