class Display {
  late List<String> inputs;
  late List<String> outputs;

  Display.parse(String s) {
    final parts = s.split(" | ");
    inputs = parts.first.split(" ");
    outputs = parts.last.split(" ");
  }

  int decodeOutputs() {
    return 42;
  }
}
