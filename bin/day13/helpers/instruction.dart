class FoldInstruction {
  late Axis axis;
  late int location;

  FoldInstruction.parse(String s) {
    // "fold at x=..."
    var relevanPart = s.split(" ").last;
    var parts = relevanPart.split("=");
    axis = parts.first == "x" ? Axis.vertical : Axis.horizontal;
    location = int.parse(parts.last);
  }
}

enum Axis { horizontal, vertical }
