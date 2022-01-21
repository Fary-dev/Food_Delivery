
class OrderModel {
  int? id;
  int idProduct;
  String nameResturant;
  String dateTime;
  String nameProduct;
  double priceProduct;
  int haveZutaten;

  OrderModel({
    this.id,
    required this.nameResturant,
    required this.dateTime,
    required this.idProduct,
    required this.nameProduct,
    required this.priceProduct,
    required this.haveZutaten,
  });

  factory OrderModel.fromMap(Map<String, dynamic> json) => OrderModel(
        id: json['id'],
        idProduct: json['idProduct'],
        nameResturant: json['nameResturant'],
        dateTime: json['dateTime'],
        nameProduct: json['nameProduct'],
        priceProduct: json['priceProduct'],
        haveZutaten: json['haveZutaten'],
      );

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['idProduct'] = idProduct;
    map['nameResturant'] = nameResturant;
    map['dateTime'] = dateTime;
    map['nameProduct'] = nameProduct;
    map['priceProduct'] = priceProduct;
    map['haveZutaten'] = haveZutaten;
    return map;
  }
}
