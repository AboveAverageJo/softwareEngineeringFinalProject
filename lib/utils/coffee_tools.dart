class CoffeeTools {
  // Input: number of cups (positive integer)
  // Output: number of ounces in a cup
  static int cupsToOunces(int cups) {
    if (cups <= 0) {
      throw ArgumentError();
    }
    return cups * 6;
  }

  static double french(int oz) {
    double fgrams = (oz * 177.42) / 14;
    return fgrams;
  }

  static double drip(int oz) {
    double dgrams = (oz * 177.42) / 17;
    return dgrams;
  }

  static double water(int oz) {
    double wgrams = (oz * 177.42);
    return wgrams;
  }
}
