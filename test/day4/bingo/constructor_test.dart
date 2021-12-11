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
  test("Cell constructors returns normally on (signed) number string", () {
    expect(() => Bingo.fromInput(sample), returnsNormally);
  });
  test("Cell constructors throws on non-number string", () {
    expect(() => Bingo.fromInput(bingoNoNumbers), throwsArgumentError);
    expect(() => Bingo.fromInput(bingoNoBoards), throwsArgumentError);
  });
}
