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
  test('lowPoint identifies low points correctly', () {
    var l = Line.parse(sampleInput[0]);
    l.analyze();
    var completion = l.complete().map((t) => t.value).toList();
    expect(completion, ["}", "}", "]", "]", ")", "}", ")", "]"]);

    l = Line.parse(sampleInput[6]);
    l.analyze();
    completion = l.complete().map((t) => t.value).toList();
    expect(completion, ["]", "]", "}", "}", "]", "}", "]", "}", ">"]);
  });
}
