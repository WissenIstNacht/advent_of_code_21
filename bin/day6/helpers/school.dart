import 'fish.dart';

class School {
  int age = 0;
  late List<Fish> fishes;

  School.fromInts(List<int> input) {
    fishes = input.map((i) => Fish.withOffset(i)).toList();
  }

  void evolve() {
    age++;
    final newFishes = <Fish>[];
    for (var fish in fishes) {
      if (fish.canReproduce()) {
        final newFish = fish.reproduce();
        newFishes.add(newFish);
      }
      fish.age();
    }
    fishes.addAll(newFishes);
  }

  int countPopulation() => fishes.length;

  List<int> getPopulationAges() =>
      fishes.map((f) => f.daysToReproduce).toList();
}
