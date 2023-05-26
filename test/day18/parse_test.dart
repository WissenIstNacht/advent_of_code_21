import 'package:test/test.dart';

import '../../bin/day18/helpers/parser.dart';

void main() {
  test("test parser on '[1,2]'", () {
    const input = "[1,2]";
    final res = parse(input);

    expect(res.parent, isNull);
    expect(res.l.isLeft, isTrue);
    expect(res.l.left, equals(1));
    expect(res.r.isLeft, isTrue);
    expect(res.r.left, equals(2));
  });
  test("test parser on '[1,[2,3]]'", () {
    const input = "[1,[2,3]]";
    final res = parse(input);

    expect(res.parent, isNull);
    expect(res.l.isLeft, isTrue);
    expect(res.l.left, equals(1));
    expect(res.r.isRight, isTrue);
    expect(res.r.right.parent, res);
    expect(res.r.right.l.isLeft, isTrue);
    expect(res.r.right.l.left, equals(2));
    expect(res.r.right.r.isLeft, isTrue);
    expect(res.r.right.r.left, equals(3));
  });
  test("test parser on '[[1,2],3]'", () {
    const input = "[[1,2],3]";
    final res = parse(input);

    expect(res.l.isRight, isTrue);
    expect(res.l.right.parent, res);
    expect(res.l.right.l.isLeft, isTrue);
    expect(res.l.right.l.left, equals(1));
    expect(res.l.right.r.isLeft, isTrue);
    expect(res.l.right.r.left, equals(2));
    expect(res.r.isLeft, isTrue);
    expect(res.r.left, equals(3));
  });
}
