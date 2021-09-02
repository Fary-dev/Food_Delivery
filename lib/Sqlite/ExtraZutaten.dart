class ExtraZutatenModel {
  int? id;
  int? idProduct;
  String? nameResturant;
  String? zutatenName;
  String? dateTime;
  String? nameProduct;
  double? price;

  ExtraZutatenModel({
    this.id,
    this.nameProduct,
    this.nameResturant,
    this.zutatenName,
    this.dateTime,
    this.idProduct,
    this.price,
  });

  factory ExtraZutatenModel.fromMap(Map<String, dynamic> json) => ExtraZutatenModel(
    id: json['id'],
    idProduct: json['idProduct'],
    nameResturant: json['nameResturant'],
    zutatenName: json['zutatenName'],
    dateTime: json['dateTime'],
    nameProduct: json['nameProduct'],
    price: json['price'],
  );

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['idProduct'] = idProduct;
    map['nameResturant'] = nameResturant;
    map['zutatenName'] = zutatenName;
    map['dateTime'] = dateTime;
    map['nameProduct'] = nameProduct;
    map['price'] = price;
    return map;
  }
}
