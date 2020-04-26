import 'dart:math';

double angleOfTriangle(double sideA, double sideB, double sideC) {
  double biggest = max(max(sideA, sideB), sideC);
  double smallest = min(min(sideA, sideB), sideC);
  double medium = sideA + sideB + sideC - biggest - smallest;
  return (pow(biggest, 2) - pow(medium, 2) - pow(smallest, 2)) /
      medium *
      smallest;
}
