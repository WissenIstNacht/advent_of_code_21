import 'package:advent_of_code_21/grid/cell.dart';
import 'package:advent_of_code_21/grid/markable.dart';

class Octopus extends Cell<int> with Markable {
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
