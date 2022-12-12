void main() {
  //Imprimir datos
  print("Hola Mundo!\n");
  //tipos de datos
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
  suma = num1 + num2;
  resta = num2 - num1;
  division = num2 / num1;
  mul = num1 * num2;

  //print("La suma de los numeros es: " + suma.toString());
  //print("La resta de los numeros es: " + resta.toString());
  //print("La division de los numeros es: " + division.toString());
  //print("La multiplicacion de los numeros es: " + mul.toString());

  //boleanos
  bool cierto = true;
  bool falso = false;
  //condicionales
  if (cierto) {
//	print("La condicional es cierta");
  }
  if (falso) {
//	print("No debe de entrar");
  } else {
//	print("La condicional es falsa");
  }

  if (!falso) {
//	print("Negamos la condicional");
  }
}
