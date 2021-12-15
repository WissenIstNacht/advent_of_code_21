import 'package:test/test.dart';

import '../../../bin/day5/point.dart';

void main() {
  test('Point constructor succeed on valid input', () {
    final s = "12,3";
    expect(() => Point.fromString(s), returnsNormally);
  });
  test('Point constructor fails on faulty input', () {
    final s = "12;3";
    expect(() => Point.fromString(s), throwsException);
  });
  test("Point constructor correctly assigns valid input", () {
    final s = "12,3";
    final p = Point.fromString(s);
    expect(p.x, equals(12));
    expect(p.y, equals(3));
  });
}
