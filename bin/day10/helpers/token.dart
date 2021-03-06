class Token {
  String value;
  static List<String> openTokens = ["(", "{", "<", "["];
  static List<String> closeTokens = [")", "}", ">", "]"];

  /* CONSTRUCTORS =========================================================== */

  Token(this.value);

  /* QUERIES ================================================================ */

  bool isOpen() => openTokens.contains(value);

  bool matchesOpenToken(Token openToken) {
    if (value == ")") {
      return openToken.value == "(";
    } else if (value == "}") {
      return openToken.value == "{";
    } else if (value == "]") {
      return openToken.value == "[";
    } else if (value == ">") {
      return openToken.value == "<";
    } else {
      throw StateError("This token is not a closing Token");
    }
  }

  int errorValue() {
    if (value == ")") {
      return 3;
    } else if (value == "]") {
      return 57;
    } else if (value == "}") {
      return 1197;
    } else if (value == ">") {
      return 25137;
    } else {
      return 0;
    }
  }

  int completionValue() {
    if (value == ")") {
      return 1;
    } else if (value == "]") {
      return 2;
    } else if (value == "}") {
      return 3;
    } else if (value == ">") {
      return 4;
    } else {
      throw StateError("This token is not a closing token");
    }
  }

  /* ACTIONS ================================================================ */

  Token match() {
    if (value == "(") {
      return Token(")");
    } else if (value == "{") {
      return Token("}");
    } else if (value == "[") {
      return Token("]");
    } else if (value == "<") {
      return Token(">");
    } else {
      throw StateError("This token is not an opening Token");
    }
  }
}
