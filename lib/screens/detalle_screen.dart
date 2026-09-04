import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tp3/entities/herramienta.dart';
import 'package:tp3/providers/herramientas_provider.dart' show herramientasProvider;

class DetalleScreen extends ConsumerWidget {
  final Herramienta product;

  const DetalleScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Escuchar el estado de herramientas para sincronizar los cambios tras editar
    final lista = ref.watch(herramientasProvider);
    final herramientaActualizada = lista.firstWhere(
      (h) => h.id == product.id,
      orElse: () => product,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle del Elemento"),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              context.push('/formulario', extra: herramientaActualizada);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // Eliminación
              ref.read(herramientasProvider.notifier).eliminar(herramientaActualizada.id);
              context.pop();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              herramientaActualizada.foto,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Container(
                    height: 200,
                    color: Colors.grey,
                    child: const Icon(Icons.image_not_supported, size: 50),
                  ),
            ),
            const SizedBox(height: 20),
            Text(
              herramientaActualizada.nombre,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Text(
              "Descripción informativa:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(herramientaActualizada.desc),
            const SizedBox(height: 15),
            const Text(
              "Cantidad en Stock:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("${herramientaActualizada.cantidad} unidades"),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}