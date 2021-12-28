import '../../day9/helpers/markable.dart';

class Octopus with Markable {
  late int content;

  /* CONSTRUCTOR ============================================================ */

  Octopus.parse(String s) {
    content = int.parse(s);
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
