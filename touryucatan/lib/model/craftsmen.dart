class Artesano {
  final int id;
  final String img;
  final String negocio;
  final String descripcion;
  final String direccion;

  const Artesano({
    required this.id,
    required this.img,
    required this.negocio,
    required this.descripcion,
    required this.direccion,
  });

  factory Artesano.fromJson(Map<String, dynamic> json) => Artesano(
        id: json['id'],
        img: json['img'],
        negocio: json['negocio'],
        descripcion: json['descripcion'],
        direccion: json['direccion'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'img': img,
        'negocio': negocio,
        'descripcion': descripcion,
        'direccion': direccion,
      };
}
