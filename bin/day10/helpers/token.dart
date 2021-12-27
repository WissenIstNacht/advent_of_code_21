class Token {
  String value;
  static List<String> openTokens = ["(", "{", "<", "["];
  static List<String> closeTokens = [")", "}", ">", "]"];

  /* CONSTRUCTORS =========================================================== */

  Token(this.value);

  /* QUERIES ================================================================ */

  bool isOpen() => openTokens.contains(value);
}
