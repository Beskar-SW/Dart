void main() {
  const clima = datos.soleado;

  switch (clima) {
    case datos.soleado:
      print("Soleado");
      break;
    case datos.lluvioso:
      print("Lluvioso");
      break;
    default:
      print("No esta en los enum");
      break;
  }
}

enum datos { soleado, lluvioso, nublado, caluroso, viento }
