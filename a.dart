void main(List<String> args) {
  //print("Hola Mundo!\n");

  //Cadenas
  String cadena1 = "Hola ";
  String cadena2 = "Mi nombre es: ";
  String cadena3 = "Johan";

  //print(cadena1 + cadena2 + cadena3);

  //Numeros enteros y float
  int num1 = 5;
  int num2 = 10;
  int suma = 0, resta = 0, mul = 0;
  double division = 0;
  // int division = 0;
  suma = num1 + num2;
  resta = num2 - num1;
  mul = num1 * num2;
  // division = num2 ~/ num1;
  division = num2 / num1;
  // String? nombre;

  // print("La suma de los numeros es: " + suma.toString());
  // print("La resta de los numeros es: " + resta.toString());
  // print("La multiplicacion de los numeros es: " + mul.toString());
  // print("La division de los numeros es: " + division.toString());

  bool cierto = true;
  bool falso = false;

  if (cierto) {
    // print("La condicional es cierta");
  }

  if (falso) {
    print("No debe de entrar");
  } else {
    print("La condicional es falsa");
  }

  if (falso) {
    print("No sirve");
  }

  if (!falso) {
    print("Negamos la condicional");
  }
}
