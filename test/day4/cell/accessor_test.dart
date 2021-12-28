import 'package:test/test.dart';

import '../../../bin/day4/helpers/cell.dart';

void main() {
  test("Get number", () {
    expect(Number.parse("2").content, equals(2));
    expect(Number.parse("1234").content, equals(1234));
    expect(Number.parse("+67867").content, equals(67867));
    expect(Number.parse("-67867").content, equals(-67867));
  });
  test("Cell constructors throws on non-number string", () {
    final c = Number.parse("42");
    expect(c.marked, isFalse);
    c.marked = true;
    expect(c.marked, isTrue);
  });
}
