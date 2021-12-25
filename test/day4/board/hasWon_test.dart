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
    expect(board.hasWon(), isFalse);
  });
  test("All fields marked", () {
    board = Board.fromLines(input);
    for (var row in board.cells) {
      for (var cell in row) {
        cell.marked = true;
      }
    }
    expect(board.hasWon(), isTrue);
  });
  test("First line all marked", () {
    board = Board.fromLines(input);
    board.cells.first.forEach((c) => c.marked = true);
    expect(board.hasWon(), isTrue);
  });
  test("First line one cell not marked", () {
    board = Board.fromLines(input);
    board.cells.first.forEach((c) => c.marked = true);
    board.cells.first.first.marked = false;
    expect(board.hasWon(), isFalse);
  });
  test("First column marked", () {
    board = Board.fromLines(input);
    final firstInRow = board.cells.map((r) => r.first);
    firstInRow.forEach((c) => c.marked = true);
    expect(board.hasWon(), isTrue);
  });
  test("First column one cell not marked", () {
    board = Board.fromLines(input);
    final firstInRow = board.cells.map((r) => r.first);
    firstInRow.forEach((c) => c.marked = true);
    board.cells.first.first.marked = false;
    expect(board.hasWon(), isFalse);
  });
}
