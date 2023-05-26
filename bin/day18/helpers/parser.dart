import 'package:either_dart/either.dart';

import 'sfn.dart';

SFN parse(String input) {
  var stack = <Either<int, SFN>>[];
  for (var i = 0; i < input.length - 1; i++) {
    var currChar = input.substring(i, i + 1);
    switch (currChar) {
      case "[":
        continue;
      case ",":
        continue;
      case "]":
        var r = stack.removeLast();
        var l = stack.removeLast();
        var sfn = SFN(l, r);
        if (r.isRight) {
          r.right.parent = sfn;
        }
        if (l.isRight) {
          l.right.parent = sfn;
        }
        stack.add(Right<int, SFN>(sfn));
        break;
      default:
        var digit = int.parse(currChar);
        var either = Left<int, SFN>(digit);
        stack.add(either);
    }
  }
  var r = stack.removeLast();
  var l = stack.removeLast();
  var sfn = SFN(l, r);
  if (r.isRight) {
    r.right.parent = sfn;
  }
  if (l.isRight) {
    l.right.parent = sfn;
  }

  return sfn;
}
