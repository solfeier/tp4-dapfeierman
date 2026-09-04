import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tp3/entities/herramienta.dart';

class HerramientasNotifier extends Notifier<List<Herramienta>> {
  @override
  List<Herramienta> build() {
    // Lista inicial hardcodeada
    return [
      Herramienta(
        id: '1',
        nombre: "Soldador",
        desc: "Instrumento con que se suelda.",
        cantidad: 12,
        foto: "https://upload.wikimedia.org/wikipedia/commons/4/4a/Soldering_gun.jpg",
      ),
      Herramienta(
        id: '2',
        nombre: "Destornillador",
        desc: "Instrumento de hierro u otra materia, que sirve para destornillar y atornillar.",
        cantidad: 19,
        foto: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9NwWx2lZNG46JNzwbQp14DLIIQ_erLjb_l5lPN58iEbAjth2vBEMu6s0&s=10",
      ),
      Herramienta(
        id: '3',
        nombre: "Tester",
        desc: "Instrumento eléctrico portátil capaz de medir directamente magnitudes eléctricas activas.",
        cantidad: 9,
        foto: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/RE50G_Range_Digital_Mutilmeter%2C_professional_Mutilmeter.jpg/250px-RE50G_Range_Digital_Mutilmeter%2C_professional_Mutilmeter.jpg",
      ),
    ];
  }

  // Alta
  void agregar(Herramienta h) {
    state = [...state, h];
  }

  // Modificación
  void editar(Herramienta hEditada) {
    state = [
      for (final item in state)
        if (item.id == hEditada.id) hEditada else item
    ];
  }

  // Baja
  void eliminar(String id) {
    state = state.where((item) => item.id != id).toList();
  }
}

final herramientasProvider = NotifierProvider<HerramientasNotifier, List<Herramienta>>(() {
  return HerramientasNotifier();
});