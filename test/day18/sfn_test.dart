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
  test("test shouldExplode() on '[[[[[1,2],3],4],[5,[[6,7],8]]],[9,0]]'", () {
    const input = "[[[[[1,2],3],4],[5,[[6,7],8]]],[9,0]]";
    final sfn = parse(input);
    final res = sfn.shouldExplode();
    expect(res.toString(), equals("[1,2]"));
  });
  test("test explode() on '[[[[[1,2],3],4],[5,[[6,7],8]]],[9,0]]'", () {
    const input = "[[[[[1,2],3],4],[5,[[6,7],8]]],[9,0]]";
    final sfn = parse(input);
    final toExplode = sfn.shouldExplode();
    toExplode!.explode();
    expect(sfn.toString(), equals("[[[[0,5],4],[5,[[6,7],8]]],[9,0]]"));
  });
  test("test shouldExplode() on '[[[[0,5],4],[5,[[6,7],8]]],[9,0]]'", () {
    const input = "[[[[0,5],4],[5,[[6,7],8]]],[9,0]]";
    final sfn = parse(input);
    final res = sfn.shouldExplode();
    expect(res.toString(), equals("[6,7]"));
  });
  test("test explode() on '[[[[0,5],4],[5,[[6,7],8]]],[9,0]]'", () {
    const input = "[[[[0,5],4],[5,[[6,7],8]]],[9,0]]";
    final sfn = parse(input);
    final toExplode = sfn.shouldExplode();
    toExplode!.explode();
    expect(sfn.toString(), equals("[[[[0,5],4],[11,[0,15]]],[9,0]]"));
  });
  test("test explode() on '[[[[[9,8],1],2],3],4]'", () {
    const input = "[[[[[9,8],1],2],3],4]";
    final sfn = parse(input);
    final toExplode = sfn.shouldExplode();
    toExplode!.explode();
    expect(sfn.toString(), equals("[[[[0,9],2],3],4]"));
  });
  test("test explode() on '[7,[6,[5,[4,[3,2]]]]]'", () {
    const input = "[7,[6,[5,[4,[3,2]]]]]";
    final sfn = parse(input);
    final toExplode = sfn.shouldExplode();
    toExplode!.explode();
    expect(sfn.toString(), equals("[7,[6,[5,[7,0]]]]"));
  });
  test("test explode() on '[[6,[5,[4,[3,2]]]],1]'", () {
    const input = "[[6,[5,[4,[3,2]]]],1]";
    final sfn = parse(input);
    final toExplode = sfn.shouldExplode();
    toExplode!.explode();
    expect(sfn.toString(), equals("[[6,[5,[7,0]]],3]"));
  });
  test(
      "test explode() on '[[[[0,[5,4]],[[7,7],[6,0]]],[[8,[7,7]],[[7,9],[5,0]]]],[[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]]]'",
      () {
    const input =
        "[[[[0,[5,4]],[[7,7],[6,0]]],[[8,[7,7]],[[7,9],[5,0]]]],[[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]]]";
    final sfn = parse(input);
    final toExplode = sfn.shouldExplode();
    toExplode!.explode();
    expect(
        sfn.toString(),
        equals(
            "[[[[5,0],[[11,7],[6,0]]],[[8,[7,7]],[[7,9],[5,0]]]],[[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]]]"));
  });
  test(
      "test explode() on '[[[[6,7],[6,7]],[[0,7],[8,9]]],[[[[6,6],0],[6,1]],[[0,8],[8,0]]]]'",
      () {
    const input =
        "[[[[6,7],[6,7]],[[0,7],[8,9]]],[[[[6,6],0],[6,1]],[[0,8],[8,0]]]]";
    final sfn = parse(input);
    final toExplode = sfn.shouldExplode();
    toExplode!.explode();
    expect(
        sfn.toString(),
        equals(
            "[[[[6,7],[6,7]],[[0,7],[8,15]]],[[[0,6],[6,1]],[[0,8],[8,0]]]]"));
  });
  test("test shouldSplit() on '[17,1]'", () {
    const input = "[7,1]";
    final sfn = parse(input);
    sfn.l = Left(17);
    final res = sfn.shouldSplit();
    expect(res.toString(), equals("[17,1]"));
  });
  test("test shouldSplit() on '[1,[17,1]]'", () {
    const input = "[1,[7,1]]";
    final sfn = parse(input);
    sfn.r.right.l = Left(17);
    final res = sfn.shouldSplit();
    expect(res.toString(), equals("[17,1]"));
  });
  test("test shouldSplit() on '[[17,1],1]'", () {
    const input = "[[7,1],1]";
    final sfn = parse(input);
    sfn.l.right.l = Left(17);
    final res = sfn.shouldSplit();
    expect(res.toString(), equals("[17,1]"));
  });
  test("test split() on '[17,1]'", () {
    const input = "[7,1]";
    final sfn = parse(input);
    sfn.l = Left(17);
    final toSplit = sfn.shouldSplit();
    toSplit!.split();
    expect(sfn.toString(), equals("[[8,9],1]"));
  });
  test("test shouldSplit() on '[1,[17,1]]'", () {
    const input = "[1,[7,1]]";
    final sfn = parse(input);
    sfn.r.right.l = Left(17);
    final toSplit = sfn.shouldSplit();
    toSplit!.split();
    expect(sfn.toString(), equals("[1,[[8,9],1]]"));
  });
  test(
      "test explode() followed by split() on '[[[[0,5],4],[5,[[6,7],8]]],[9,0]]'",
      () {
    const input = "[[[[0,5],4],[5,[[6,7],8]]],[9,0]]";
    final sfn = parse(input);
    final toExplode = sfn.shouldExplode();
    toExplode!.explode();
    final toSplit = sfn.shouldSplit();
    toSplit!.split();
    expect(sfn.toString(), equals("[[[[0,5],4],[[5,6],[0,15]]],[9,0]]"));
  });
  test("test reduce() on '[[[[[4,3],4],4],[7,[[8,4],9]]],[1,1]]'", () {
    const input = "[[[[[4,3],4],4],[7,[[8,4],9]]],[1,1]]";
    final sfn = parse(input);
    sfn.reduce();
    expect(sfn.toString(), equals("[[[[0,7],4],[[7,8],[6,0]]],[8,1]]"));
  });
  test("test '[[[[[4,3],4],4],[7,[[8,4],9]]]' + '[1,1]'", () {
    const input1 = "[[[[4,3],4],4],[7,[[8,4],9]]]";
    const input2 = "[1,1]";

    final sfn1 = parse(input1);
    final sfn2 = parse(input2);

    final res = sfn1.add(sfn2);
    expect(res.toString(), equals("[[[[0,7],4],[[7,8],[6,0]]],[8,1]]"));
  });
  test(
      "test [[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]] + [7,[[[3,7],[4,3]],[[6,3],[8,8]]]]",
      () {
    const input1 = "[[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]";
    const input2 = "[7,[[[3,7],[4,3]],[[6,3],[8,8]]]]";

    final sfn1 = parse(input1);
    final sfn2 = parse(input2);

    final res = sfn1.add(sfn2);
    expect(res.toString(),
        equals("[[[[4,0],[5,4]],[[7,7],[6,0]]],[[8,[7,7]],[[7,9],[5,0]]]]"));
  });
  test(
      "test [[[[4,0],[5,4]],[[7,7],[6,0]]],[[8,[7,7]],[[7,9],[5,0]]]] + [[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]]",
      () {
    const input1 = "[[[[4,0],[5,4]],[[7,7],[6,0]]],[[8,[7,7]],[[7,9],[5,0]]]]";
    const input2 = "[[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]]";

    final sfn1 = parse(input1);
    final sfn2 = parse(input2);

    final res = sfn1.add(sfn2);
    expect(
        res.toString(),
        equals(
            "[[[[6,7],[6,7]],[[7,7],[0,7]]],[[[8,7],[7,7]],[[8,8],[8,0]]]]"));
  });
  test(
      "test [[[[6,7],[6,7]],[[7,7],[0,7]]],[[[8,7],[7,7]],[[8,8],[8,0]]]] + [[[[2,4],7],[6,[0,5]]],[[[6,8],[2,8]],[[2,1],[4,5]]]]",
      () {
    const input1 =
        "[[[[6,7],[6,7]],[[7,7],[0,7]]],[[[8,7],[7,7]],[[8,8],[8,0]]]]";
    const input2 = "[[[[2,4],7],[6,[0,5]]],[[[6,8],[2,8]],[[2,1],[4,5]]]]";

    final sfn1 = parse(input1);
    final sfn2 = parse(input2);

    final res = sfn1.add(sfn2);
    expect(
        res.toString(),
        equals(
            "[[[[7,0],[7,7]],[[7,7],[7,8]]],[[[7,7],[8,8]],[[7,7],[8,7]]]]"));
  });
  test(
      "test [[[[7,0],[7,7]],[[7,7],[7,8]]],[[[7,7],[8,8]],[[7,7],[8,7]]]] + [7,[5,[[3,8],[1,4]]]]",
      () {
    const input1 =
        "[[[[7,0],[7,7]],[[7,7],[7,8]]],[[[7,7],[8,8]],[[7,7],[8,7]]]]";
    const input2 = "[7,[5,[[3,8],[1,4]]]]";

    final sfn1 = parse(input1);
    final sfn2 = parse(input2);

    final res = sfn1.add(sfn2);
    expect(
        res.toString(),
        equals(
            "[[[[7,7],[7,8]],[[9,5],[8,7]]],[[[6,8],[0,8]],[[9,9],[9,0]]]]"));
  });
  test("test magnitude() on '[[1,2],[[3,4],5]]'", () {
    const input = "[[1,2],[[3,4],5]]";
    final sfn = parse(input);
    final res = sfn.magnitude();
    expect(res, equals(143));
  });
  test("test magnitude() on '[[[[0,7],4],[[7,8],[6,0]]],[8,1]]'", () {
    const input = "[[[[0,7],4],[[7,8],[6,0]]],[8,1]]";
    final sfn = parse(input);
    final res = sfn.magnitude();
    expect(res, equals(1384));
  });
  test(
      "test magnitude() on '[[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]]'",
      () {
    const input = "[[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]]";
    final sfn = parse(input);
    final res = sfn.magnitude();
    expect(res, equals(3488));
  });
}
