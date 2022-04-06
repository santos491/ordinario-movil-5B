class Restaurante {
  final int id;
  final String img;
  final String restaurante;
  final String descripcion;
  final String menu;
  final String direccion;

  const Restaurante({
    required this.id,
    required this.img,
    required this.restaurante,
    required this.menu,
    required this.descripcion,
    required this.direccion,
    
  });

  factory Restaurante.fromJson(Map<String, dynamic> json) => Restaurante(
        id: json['id'],
        img: json['img'],
        restaurante: json['restaurante'],
        menu: json['menu'],
        descripcion: json['descripcion'],
        direccion: json['direccion'],
       // telefono: json['telefono'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'img': img,
        'restaurante': restaurante,
        'menu': menu,
        'descripcion': descripcion,
        'direccion': direccion,
        //'telefono': telefono,
      };
}