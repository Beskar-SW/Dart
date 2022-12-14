import "package:alfred/alfred.dart";
import "package:encrypt/encrypt.dart";

bool usuarioExiste(String correo, List<Map<String, dynamic>> usuarios) {
  for (var i = 0; i < usuarios.length; i++) {
    if (usuarios[i]["correo"] == correo) {
      return true;
    }
  }
  return false;
}

Map<String, dynamic>? usuarioPorCorreo(
    String correo, List<Map<String, dynamic>> usuarios) {
  for (var i = 0; i < usuarios.length; i++) {
    if (usuarios[i]["correo"] == correo) {
      return usuarios[i];
    }
  }
  return null;
}

void main() async {
  Alfred alfred = Alfred();

  final key = Key.fromUtf8('my 32 length key................');
  final iv = IV.fromLength(16);

  final encrypter = Encrypter(AES(key));

  List<Map<String, dynamic>> usuarios = [
    {
      "nombre": "Johan",
      "correo": "johan@gmail.com",
      "contrasena": encrypter.encrypt("123456", iv: iv).base64,
    },
    {
      "nombre": "Juan",
      "correo": "juan@hotmail.com",
      "contrasena": encrypter.encrypt("123456", iv: iv).base64,
    },
    {
      "nombre": "Pedro",
      "correo": "P@gmail.com",
      "contrasena": encrypter.encrypt("123456", iv: iv).base64,
    },
  ];

  alfred.get("/", (req, res) {
    res.send("Hello World");
  });

  alfred.post("/registro", (req, res) async {
    final body = await req.bodyAsJsonMap;

    final nombre = body["nombre"];
    final correo = body["correo"];
    final contrasena = body["contrasena"];

    final usuario = {
      "nombre": nombre,
      "correo": correo,
      "contrasena": encrypter.encrypt(contrasena, iv: iv).base64,
    };

    if (usuarioExiste(correo, usuarios)) {
      res.json({
        "ok": false,
        "error": "El usuario ya existe",
      });
    } else {
      usuarios.add(usuario);
      res.json({
        "ok": true,
        "usuario": usuario,
      });
      print(usuarios);
    }
  });

  alfred.post("/login", (req, res) async {
    final body = await req.bodyAsJsonMap;

    final correo = body["correo"];
    final contrasena = body["contrasena"];

    Map<String, dynamic>? usuario = usuarioPorCorreo(correo, usuarios);

    if (usuario == null) {
      res.json({
        "ok": false,
        "error": "El usuario no existe",
      });
    } else {
      final contrasenaEncriptada = usuario["contrasena"];
      final contrasenaDesencriptada =
          encrypter.decrypt64(contrasenaEncriptada, iv: iv);

      if (contrasenaDesencriptada == contrasena) {
        res.json({
          "ok": true,
          "usuario": usuario,
        });
      } else {
        res.json({"ok": false});
      }
    }
  });

  await alfred.listen();

  print("Servidor creado");
  print("http://localhost:3000");
}
