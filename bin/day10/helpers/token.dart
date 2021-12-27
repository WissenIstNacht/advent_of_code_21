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
}
