import 'status.dart';
import 'token.dart';

class Line {
  late List<Token> tokens;

  List<Token> stack = [];
  String illegalCharacter = "";
  Status state = Status.unknown;

  /* CONSTRUCTORS =========================================================== */

  Line.parse(String line) {
    tokens = line.split("").map((s) => Token(s)).toList();
  }

  /* QUERIES ================================================================ */

  bool isCorrupted() => state == Status.corrupted;

  int errorValue() {
    if (illegalCharacter == ")") {
      return 3;
    } else if (illegalCharacter == "]") {
      return 57;
    } else if (illegalCharacter == "}") {
      return 1197;
    } else if (illegalCharacter == ">") {
      return 25137;
    } else {
      return 0;
    }
  }

  /* ACTIONS ================================================================ */

  void analyzeLine() {
    for (var token in tokens) {
      if (token.isOpen()) {
        stack.add(token);
      } else {
        final lastOpener = stack.removeLast();
        if (!token.matchesOpenToken(lastOpener)) {
          illegalCharacter = token.value;
          state = Status.corrupted;
          return;
        }
      }
    }
  }
}
