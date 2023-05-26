import 'package:either_dart/either.dart';

class SFN {
  // todo: Maybe add depth information.
  SFN? parent;
  Either<int, SFN> l;
  Either<int, SFN> r;

  SFN(this.l, this.r);

  @override
  String toString() {
    var leftString = "";
    if (l.isLeft) {
      leftString = l.left.toString();
    } else {
      leftString = l.right.toString();
    }

    var rightString = "";
    if (r.isLeft) {
      rightString = r.left.toString();
    } else {
      rightString = r.right.toString();
    }
    return "[" + leftString + "," + rightString + "]";
  }
}

enum NodeType { root, leftChild, rightChild }
