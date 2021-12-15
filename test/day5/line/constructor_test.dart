import 'package:test/test.dart';

import '../../../bin/day5/line.dart';

void main() {
  test('Line constructor succeed on valid input', () {
    final s = "12,3->5,7";
    expect(() => Line.fromString(s), returnsNormally);
  });
  test('Line constructor fails on faulty input', () {
    final s2 = "12, 3 -> 5,7";
    expect(() => Line.fromString(s2), throwsException);
  });
  test("Line constructor correctly assigns valid input", () {
    final s = "12,3 -> 5,7";
    final p = Line.fromString(s);
    expect(p.start.x, equals(12));
    expect(p.start.y, equals(3));
    expect(p.end.x, equals(5));
    expect(p.end.y, equals(7));
  });
}
