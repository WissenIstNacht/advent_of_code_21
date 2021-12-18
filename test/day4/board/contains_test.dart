import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../../bin/day4/helpers/board.dart';

void main() {
  late List<String> input;
  late Board board;
  setUpAll(() {
    input = readTestInput(4, "board");
    board = Board.fromLines(input);
  });
  test("Board contains Cell with numbers in input", () {
    expect(board.contains(22), isNotNull);
    expect(board.contains(24), isNotNull);
    expect(board.contains(0), isNotNull);
  });
  test("Board does not contain Cell with number from input", () {
    expect(board.contains(62), isNull);
    expect(board.contains(74), isNull);
    expect(board.contains(80), isNull);
  });
}
