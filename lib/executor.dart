import 'solver.dart';
import 'utils.dart';

class Executor {
  static void execute(Solver solver) {
    print("Starting Program ---");
    var input = readInput(solver.day);
    var output = solver.solve(input);
    prettyPrint(output);
    print("Ending Program ---");
  }
}
