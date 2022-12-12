// int suma(int p1, int p2) {
//   return p1 + p2;
// }

int suma(int p1, int p2) => p1 + p2;

int resta(int p1, int p2) {
  return p1 - p2;
}

double division(int p1, int p2) {
  return p1 / p2;
}

int multiplicacion(int p1, int p2) {
  return p1 * p2;
}

void main() {
  int num1 = 5, num2 = 10;
  int sum = suma(num1, num2);
  int rest = resta(num2, num1);
  double div = division(num2, num1);
  int mul = multiplicacion(num1, num2);

  print("La suma de los numeros $num1 y $num2 es: $sum");
  print("La resta de los numeros $num1 y $num2 es: $rest");
  print("La division de los numeros $num1 y $num2 es: $div");
  print("La multiplicacion de los numeros $num1 y $num2 es: $mul");
  imprimir("Cadena a imprimir");
}

void imprimir(String cadena) {
  print(cadena);
}
