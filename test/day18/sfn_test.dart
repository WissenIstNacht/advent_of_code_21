import 'package:either_dart/either.dart';
import 'package:test/test.dart';

import '../../bin/day18/helpers/parser.dart';

void main() {
  test("test toString() on '[1,2]'", () {
    const input = "[1,2]";
    final sfn = parse(input);
    final res = sfn.toString();
    expect(res, equals("[1,2]"));
  });
  test("test toString() on '[1,[2,3]]'", () {
    const input = "[1,[2,3]]";
    final sfn = parse(input);
    final res = sfn.toString();
    expect(res, equals("[1,[2,3]]"));
  });
  test("test toString() on '[[1,2],3]'", () {
    const input = "[[1,2],3]";
    final sfn = parse(input);
    final res = sfn.toString();
    expect(res, equals("[[1,2],3]"));
  });
  test("test toString() on '[[[[[1,2],3],4],[5,[[6,7],8]]],[9,0]]'", () {
    const input = "[[[[[1,2],3],4],[5,[[6,7],8]]],[9,0]]";
    final sfn = parse(input);
    final res = sfn.toString();
    expect(res, equals("[[[[[1,2],3],4],[5,[[6,7],8]]],[9,0]]"));
  });
}
