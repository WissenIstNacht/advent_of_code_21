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

  /* ACTIONS ================================================================ */

  void analyzeCorruptedLine(String line) {
    for (var token in tokens) {
      if (token.isOpen()) {
        stack.add(token);
      } else {
        final lastOpener = stack.removeLast();
        if (lastOpener.value != token.value) {
          illegalCharacter = token.value;
          state = Status.corrupted;
          return;
        }
      }
    }
  }
}
