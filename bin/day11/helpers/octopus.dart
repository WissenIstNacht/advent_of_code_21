import 'package:advent_of_code_21/grid/cell.dart';

class Octopus extends MarkableCell<int> {
  /* CONSTRUCTOR ============================================================ */

  Octopus.parse(String s) : super(int.parse(s)) {
    marked = false;
  }

  /* QUERIES ================================================================ */

  bool isFull() => content > 9;

  /* ACTIONS ================================================================ */

  void flash() => marked = true;

  void reset() {
    content = 0;
    marked = false;
  }

  void fill() => content++;
}
