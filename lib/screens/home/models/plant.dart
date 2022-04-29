
class Plantlist{
  List<Plant>? plantList;
  Plantlist({this.plantList});
  factory Plantlist.fromJson(List<dynamic> json){
    return Plantlist(
      plantList: json.map((e) => Plant.fromJson(e)).toList()
    );
  }
}
class Plant {
  String? category;
  double? price;
  String? instructions;
  String? photo;
  String? name;
  int? productId;

  Plant(
      {this.category,
        this.price,
        this.instructions,
        this.photo,
        this.name,
        this.productId});

  Plant.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    price = json['price'];
    instructions = json['instructions'];
    photo = json['photo'];
    name = json['name'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['price'] = this.price;
    data['instructions'] = this.instructions;
    data['photo'] = this.photo;
    data['name'] = this.name;
    data['productId'] = this.productId;
    return data;
  }
}