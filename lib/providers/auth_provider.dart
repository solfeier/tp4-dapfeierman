import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tp3/entities/user.dart';

class AuthNotifier extends Notifier<User?> {
  // Base de datos local simulada de usuarios
  final List<User> _usuariosValidos = [
    User(nombre: 'Administrador', username: 'admin@mail.com', password: '123'),
    User(nombre: 'Alumno', username: 'alumno', password: 'user2026'),
  ];

  @override
  User? build() => null; // Inicia sin usuario logueado

  bool login(String username, String password) {
    for (var u in _usuariosValidos) {
      if (u.username == username && u.password == password) {
        state = u;
        return true;
      }
    }
    return false;
  }

  bool register(String nombre, String email, String password) {
    // Verificar si el usuario ya existe
    bool existe = _usuariosValidos.any((u) => u.username == email);
    if (existe) return false;

    final nuevoUsuario = User(
      nombre: nombre,
      username: email,
      password: password,
    );

    _usuariosValidos.add(nuevoUsuario);
    state = nuevoUsuario; // Auto-login tras registrarse
    return true;
  }

  void logout() {
    state = null;
  }
}

final authProvider = NotifierProvider<AuthNotifier, User?>(() {
  return AuthNotifier();
});