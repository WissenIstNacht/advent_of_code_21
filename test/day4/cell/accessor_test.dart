import 'package:test/test.dart';

import '../../../bin/day4/helpers/cell.dart';

void main() {
  test("Get number", () {
    expect(Cell.fromString("2").number, equals(2));
    expect(Cell.fromString("1234").number, equals(1234));
    expect(Cell.fromString("+67867").number, equals(67867));
    expect(Cell.fromString("-67867").number, equals(-67867));
  });
  test("Cell constructors throws on non-number string", () {
    final c = Cell.fromString("42");
    expect(c.marked, isFalse);
    c.marked = true;
    expect(c.marked, isTrue);
  });
}
