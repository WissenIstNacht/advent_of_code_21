import 'package:advent_of_code_21/solver.dart';

import 'helpers/school.dart';

class Day6Part1 extends Solver {
  Day6Part1() : super(6);

  @override
  String solve(List<String> input) {
    final parsedInput = input[0].split(",").map((s) => int.parse(s)).toList();
    final school = School.fromInts(parsedInput);

    while (school.age < 80) {
      school.evolve();
    }

    return school.countPopulation().toString();
  }
}
