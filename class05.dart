void main() {
  List<String> lista = ["Johan", "Argenis", "Franco", "Rogel"];

  lista.forEach((elemento) {
    print(elemento);
  });

  lista.forEach((elemento) => print("Nombre: $elemento"));
}
