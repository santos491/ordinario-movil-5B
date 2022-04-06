class recorridoo {

  String id;
  String name;
  String description;
  String image;
  String direction;
 

  recorridoo({this.id = "",
      this.name = "",
      this.description = "",
      this.image = "",
      this.direction = "",
      });

  factory recorridoo.fromJson(Map<String, dynamic> json) {
    return recorridoo(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      direction: json['direction'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['direction'] = this.direction;
    return data;
  }

}