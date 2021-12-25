import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../../bin/day4/helpers/board.dart';

void main() {
  late List<String> input;
  late Board board;
  setUp(() {
    input = readTestInput(4, "board");
  });
  test("No fields marked", () {
    board = Board.fromLines(input);
    expect(board.getScore(), 300);
  });
  test("All fields marked", () {
    board = Board.fromLines(input);
    for (var row in board.cells) {
      for (var cell in row) {
        cell.marked = true;
      }
    }
    expect(board.getScore(), 0);
  });
  test("First line all marked", () {
    board = Board.fromLines(input);
    board.cells.first.forEach((c) => c.marked = true);
    expect(board.getScore(), 237);
  });
  test("First column marked", () {
    board = Board.fromLines(input);
    final firstInRow = board.cells.map((r) => r.first);
    firstInRow.forEach((c) => c.marked = true);
    expect(board.getScore(), 242);
  });
}
