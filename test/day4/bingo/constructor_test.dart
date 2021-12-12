import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../../bin/day4/bingo.dart';

void main() {
  late List<String> sample, bingoNoNumbers, bingoNoBoards;
  setUpAll(() {
    sample = readSampleInput(4);
    bingoNoNumbers = readTestInput(4, "bingoNoNumbers");
    bingoNoBoards = readTestInput(4, "bingoNoBoards");
  });
  test("Bingo constructor returns normally on sample input", () {
    expect(() => Bingo.fromInput(sample), returnsNormally);
  });
  test("Bingo constructor throws on erroneous input", () {
    expect(() => Bingo.fromInput(bingoNoNumbers), throwsArgumentError);
    expect(() => Bingo.fromInput(bingoNoBoards), throwsArgumentError);
  });
}
