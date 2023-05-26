import 'package:either_dart/either.dart';

class SFN {
  // todo: Maybe add depth information.
  SFN? parent;
  Either<int, SFN> l;
  Either<int, SFN> r;

  SFN(this.l, this.r);

  SFN add(SFN other) {
    var newSfn = SFN(Right<int, SFN>(this), Right<int, SFN>(other));
    newSfn.l.right.parent = newSfn;
    newSfn.r.right.parent = newSfn;
    newSfn.reduce();
    return newSfn;
  }

  SFN? shouldExplode([int depth = 0]) {
    if (l.isRight) {
      var toExplode = l.right.shouldExplode(depth + 1);
      if (toExplode != null) return toExplode;
    }

    if (r.isRight) {
      var toExplode = r.right.shouldExplode(depth + 1);
      if (toExplode != null) return toExplode;
    }

    if (depth >= 4) {
      return this;
    } else {
      return null; // reached a leaf but it's not nested deelpy enough
    }
  }

  void explode() {
    // find first ancestor whose left child is a regular number
    SFN? curr = this;
    while (curr != null) {
      if (curr.isRightChild()) {
        var p = curr.parent!;
        if (p.l.isLeft) {
          p.l = Left(p.l.left + l.left);
          break;
        }
        var node = p.l.right.findRightestLeaf();
        node.r = Left(node.r.left + l.left);
        break;
      }
      curr = curr.parent;
    }
    // find first ancestor whose right child is a regular number
    curr = this;
    while (curr != null) {
      if (curr.isLeftChild()) {
        var p = curr.parent!;
        if (p.r.isLeft) {
          p.r = Left(p.r.left + r.left);
          break;
        }
        var node = p.r.right.findLeftestLeaf();
        node.l = Left(node.l.left + r.left);
        break;
      }
      curr = curr.parent;
    }

    if (isLeftChild()) {
      parent!.l = Left<int, SFN>(0);
    }
    if (isRightChild()) {
      parent!.r = Left<int, SFN>(0);
    }
  }

  SFN findLeftestLeaf() {
    if (l.isLeft) {
      return this;
    } else {
      return l.right.findLeftestLeaf();
    }
  }

  SFN findRightestLeaf() {
    if (r.isLeft) {
      return this;
    } else {
      return r.right.findRightestLeaf();
    }
  }

  SFN? shouldSplit() {
    if (l.isLeft && l.left >= 10) {
      return this;
    }

    if (l.isRight) {
      var toSplit = l.right.shouldSplit();
      if (toSplit != null) return toSplit;
    }

    if (r.isLeft && r.left >= 10) {
      return this;
    }

    if (r.isRight) {
      var toSplit = r.right.shouldSplit();
      if (toSplit != null) return toSplit;
    }
  }

  void split() {
    if (l.isLeft && l.left >= 10) {
      var newL = l.left ~/ 2;
      var newR = l.left - newL;
      var newNode = SFN(Left(newL), Left(newR));
      l = Right(newNode);
      newNode.parent = this;
      return;
    }
    if (r.isLeft && r.left >= 10) {
      var newL = r.left ~/ 2;
      var newR = r.left - newL;
      var newNode = SFN(Left(newL), Left(newR));
      r = Right(newNode);
      newNode.parent = this;
      return;
    }
  }

  void reduce() {
    while (true) {
      var toExplode = shouldExplode();
      if (toExplode != null) {
        toExplode.explode();
        continue;
      }

      var toSplit = shouldSplit();
      if (toSplit != null) {
        toSplit.split();
        continue;
      }
      return;
    }
  }

  bool isLeftChild() {
    if (parent == null) return false;
    if (parent!.l.isRight && parent!.l.right == this) return true;
    return false;
  }

  bool isRightChild() {
    if (parent == null) return false;
    if (parent!.r.isRight && parent!.r.right == this) return true;
    return false;
  }

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
