class ExtraZutatenModel {
  int? id;
  int? orderId;
  String nameResturant;
  String zutatenName;
  String? dateTime;
  String nameProduct;
  double price;

  ExtraZutatenModel({
    this.id,
    required this.orderId,
    required this.nameProduct,
    required this.nameResturant,
    required this.zutatenName,
    this.dateTime,
    required this.price,
  });

  factory ExtraZutatenModel.fromMap(Map<String, dynamic> json) => ExtraZutatenModel(
    id: json['id'],
    nameResturant: json['nameResturant'],
    zutatenName: json['zutatenName'],
    dateTime: json['dateTime'],
    nameProduct: json['nameProduct'],
    price: json['price'],
    orderId: json['orderId'],
  );

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['nameResturant'] = nameResturant;
    map['zutatenName'] = zutatenName;
    map['dateTime'] = dateTime;
    map['nameProduct'] = nameProduct;
    map['price'] = price;
    map['orderId'] = orderId;
    return map;
  }
}
