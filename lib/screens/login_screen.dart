import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tp3/providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ingresar")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userController,
              decoration: const InputDecoration(labelText: "Usuario o email"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Contraseña"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String ingresadoUser = userController.text.trim();
                String ingresadoPass = passwordController.text.trim();

                bool exito = ref.read(authProvider.notifier).login(ingresadoUser, ingresadoPass);

                if (exito) {
                  context.go('/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Usuario o contraseña incorrectos"),
                    ),
                  );
                }
              },
              child: const Text("Iniciar Sesión"),
            ),
            TextButton(
              onPressed: () {
                context.push('/register');
              },
              child: const Text("¿No tienes cuenta? Regístrate aquí"),
            )
          ],
        ),
      ),
    );
  }
}