import 'dart:math';

double angleOfTriangle(double sideA, double sideB, double sideC) {
  double biggest = max(max(sideA, sideB), sideC);
  double smallest = min(min(sideA, sideB), sideC);
  double medium;
  if (sideA > smallest && sideA < biggest) {
    medium = sideA;
  } else if (sideB > smallest && sideB < biggest) {
    medium = sideB;
  } else {
    medium = sideC;
  }
  double answer =
      (pow(biggest, 2) - pow(medium, 2) - pow(smallest, 2)) / medium * smallest;
  return answer;
}
