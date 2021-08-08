class OrderModel {
  int? id1;
  int? idProduct;
  String? nameResturant;
  String? dateTime;
  String? nameProduct;
  double? priceProduct;

  OrderModel({
    this.id1,
    this.nameResturant,
    this.dateTime,
    this.idProduct,
    this.nameProduct,
    this.priceProduct,
  });



  factory OrderModel.fromMap(Map<String, dynamic> json) => OrderModel(
        id1: json['id1'],
        idProduct: json['idProduct'],
        nameResturant: json['nameResturant'],
        dateTime: json['dateTime'],
        nameProduct: json['nameProduct'],
        priceProduct: json['priceProduct'],
      );

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id1 != null) {
      map['id1'] = id1;
    }
    map['idProduct'] = idProduct;
    map['nameResturant'] = nameResturant;
    map['dateTime'] = dateTime;
    map['nameProduct'] = nameProduct;
    map['priceProduct'] = priceProduct;
    return map;
  }
}
