class Cell {
  late int _number;
  bool marked = false;

  Cell.fromString(String s) {
    _number = int.parse(s);
  }

  int get number => _number;
}
