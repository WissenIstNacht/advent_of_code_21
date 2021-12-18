import 'package:test/test.dart';

import '../../../bin/day5/helpers/line.dart';

void main() {
  test('Line constructor succeed on valid input', () {
    final s = "12,3->5,7";
    expect(() => Line.fromString(s), returnsNormally);
  });
  test('Line constructor fails on faulty input', () {
    final s2 = "12, 3 -> 5,7";
    expect(() => Line.fromString(s2), throwsException);
  });
  test("Line constructor correctly assigns point values correctly", () {
    final s = "12,3 -> 5,7";
    final p = Line.fromString(s);
    expect(p.start.x, equals(12));
    expect(p.start.y, equals(3));
    expect(p.end.x, equals(5));
    expect(p.end.y, equals(7));
  });
  test("Line constructor correctly assigns point values correctly", () {
    final s = "1,3 -> 5,7";
    final t = "12,9 -> 5,7";
    final p = Line.fromString(s);
    final q = Line.fromString(t);

    expect(p.horizontalDirection, equals(1));
    expect(p.verticalDirection, equals(1));
    expect(q.horizontalDirection, equals(-1));
    expect(q.verticalDirection, equals(-1));
  });
  test('AxialLine constructor succeed on valid input', () {
    final s = "12,3 -> 5,7";
    expect(() => Line.fromString(s), returnsNormally);
  });
  test("Line constructor correctly assigns valid input", () {
    final s = "12,3 -> 5,3";
    final t = "12,3 -> 12,14";
    final p = Line.fromString(s);
    final q = Line.fromString(t);

    expect(p.isAxial(), isTrue);
    expect(p.isAxial(), isTrue);
    expect(q.isAxial(), isTrue);
    expect(q.isAxial(), isTrue);
  });
}
