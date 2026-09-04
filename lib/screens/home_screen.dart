import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tp3/providers/auth_provider.dart';
import 'package:tp3/providers/herramientas_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listaHerramientas = ref.watch(herramientasProvider);
    final usuario = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Hola, ${usuario?.nombre ?? 'Usuario'}"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authProvider.notifier).logout();
              context.go('/login');
            },
          )
        ],
      ),
      body: listaHerramientas.isEmpty
          ? const Center(child: Text("No hay herramientas registradas."))
          : ListView.builder(
              itemCount: listaHerramientas.length,
              itemBuilder: (context, index) {
                final prod = listaHerramientas[index];

                return ListTile(
                  leading: Image.network(
                    prod.foto,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.build, size: 40),
                  ),
                  title: Text(prod.nombre),
                  subtitle: Text("Cantidad: ${prod.cantidad}"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    context.push('/detalle', extra: prod);
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/formulario');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}