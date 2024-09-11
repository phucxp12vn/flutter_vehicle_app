enum CountCategory { vehicle, person, photo, scan, signature }

class IncrementCountAction {
  final CountCategory category;
  IncrementCountAction(this.category);
}
