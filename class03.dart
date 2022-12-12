import 'dart:io';

void main() {
  //input user
  // print("Escribe tu nombre: ");
  // // String? name = stdin.readLineSync();

  // print("Escribe tu edad: ");
  // // String? age = stdin.readLineSync();
  // int? option = int.parse(stdin.readLineSync()!);

  //output
  // print("Hola $name, tienes $option años");

  while (true) {
    menu();
    String? option = stdin.readLineSync();
    switch (option) {
      case "1":
        suma();
        break;
      case "2":
        resta();
        break;
      case "3":
        multiplicacion();
        break;
      case "4":
        division();
        break;
      case "5":
        print("Saliendo...");
        exit(0);
      default:
        print("Opción no válida");
    }
  }
}

void menu() {
  print("\nMenu de opciones");
  print("1. Suma");
  print("2. Resta");
  print("3. Multiplicación");
  print("4. División");
  print("5. Salir");
}

void suma() {
  print("Escribe 2 números separados por comas (ej: 25,35): ");
  String? numbers = stdin.readLineSync();
  List<String> list = numbers!.split(",");
  int num1 = int.parse(list[0]);
  int num2 = int.parse(list[1]);
  print("La suma es: ${num1 + num2}");
}

void resta() {
  print("Escribe 2 números separados por comas (ej: 25,35): ");
  String? numbers = stdin.readLineSync();
  List<String> list = numbers!.split(",");
  int num1 = int.parse(list[0]);
  int num2 = int.parse(list[1]);
  print("La resta es: ${num1 - num2}");
}

void multiplicacion() {
  print("Escribe 2 números separados por comas (ej: 25,35): ");
  String? numbers = stdin.readLineSync();
  List<String> list = numbers!.split(",");
  int num1 = int.parse(list[0]);
  int num2 = int.parse(list[1]);
  print("La multiplicación es: ${num1 * num2}");
}

void division() {
  print("Escribe 2 números separados por comas (ej: 25,35): ");
  String? numbers = stdin.readLineSync();
  List<String> list = numbers!.split(",");
  int num1 = int.parse(list[0]);
  int num2 = int.parse(list[1]);
  print("La división es: ${num1 / num2}");
}
