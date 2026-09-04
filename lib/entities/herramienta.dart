class Herramienta {
  String id;
  String nombre;
  String desc;
  int cantidad;
  String foto;

  Herramienta({
    required this.id,
    required this.nombre,
    required this.desc,
    required this.cantidad,
    required this.foto,
  });

  Herramienta copyWith({
    String? id,
    String? nombre,
    String? desc,
    int? cantidad,
    String? foto,
  }) {
    return Herramienta(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      desc: desc ?? this.desc,
      cantidad: cantidad ?? this.cantidad,
      foto: foto ?? this.foto,
    );
  }
}