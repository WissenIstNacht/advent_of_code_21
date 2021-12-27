import 'status.dart';
import 'token.dart';

class Line {
  late List<Token> tokens;

  List<Token> stack = [];
  Token? illegalCharacter;
  Status state = Status.unknown;

  /* CONSTRUCTORS =========================================================== */

  Line.parse(String line) {
    tokens = line.split("").map((s) => Token(s)).toList();
  }

  /* QUERIES ================================================================ */

  bool isCorrupted() => state == Status.corrupted;

  /* ACTIONS ================================================================ */

  void analyze() {
    for (var token in tokens) {
      if (token.isOpen()) {
        stack.add(token);
      } else {
        final lastOpener = stack.removeLast();
        if (!token.matchesOpenToken(lastOpener)) {
          illegalCharacter = token;
          state = Status.corrupted;
          return;
        }
      }
    }
    state = Status.incomplete;
  }

  List<Token> complete() {
    return stack.reversed.map((t) => t.match()).toList();
  }
}
