import 'package:test/test.dart';

import '../../../bin/day4/cell.dart';

void main() {
  test("Cell constructors returns normally on (signed) number string", () {
    expect(() => Cell.fromString("2"), returnsNormally);
    expect(() => Cell.fromString("1234"), returnsNormally);
    expect(() => Cell.fromString("+67867"), returnsNormally);
    expect(() => Cell.fromString("-67867"), returnsNormally);
  });
  test("Cell constructors throws on non-number string", () {
    expect(() => Cell.fromString("x"), throwsFormatException);
    expect(() => Cell.fromString("x2"), throwsFormatException);
  });
}
