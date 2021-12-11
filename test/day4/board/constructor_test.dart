import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../../bin/day4/board.dart';

void main() {
  late List<String> correctBoard, faultyRows, faultyCols;
  setUpAll(() {
    correctBoard = readTestInput(4, "board");
    faultyRows = readTestInput(4, "boardRow");
    faultyCols = readTestInput(4, "boardCol");
  });
  test("Board constructors returns normally on (signed) number string", () {
    expect(() => Board.fromLines(correctBoard), returnsNormally);
  });
  test("Cell constructors throws on non-number string", () {
    expect(() => Board.fromLines(faultyRows), throwsArgumentError);
    expect(() => Board.fromLines(faultyCols), throwsArgumentError);
  });
}
