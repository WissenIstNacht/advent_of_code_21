class Fish {
  late int daysToReproduce;

  Fish() : daysToReproduce = 8;

  Fish.withOffset(this.daysToReproduce);

  void age() {
    var newDays = daysToReproduce - 1;
    if (newDays < 0) {
      daysToReproduce = 6;
    } else {
      daysToReproduce = daysToReproduce = newDays;
    }
  }

  bool canReproduce() => daysToReproduce == 0;

  Fish reproduce() {
    return Fish();
  }
}
