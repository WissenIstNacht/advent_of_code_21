import 'package:test/test.dart';

import '../../../bin/day4/helpers/number.dart';

void main() {
  test("Cell constructors returns normally on (signed) number string", () {
    expect(() => Number.parse("2"), returnsNormally);
    expect(() => Number.parse("1234"), returnsNormally);
    expect(() => Number.parse("+67867"), returnsNormally);
    expect(() => Number.parse("-67867"), returnsNormally);
  });
  test("Cell constructors throws on non-number string", () {
    expect(() => Number.parse("x"), throwsFormatException);
    expect(() => Number.parse("x2"), throwsFormatException);
  });
}
